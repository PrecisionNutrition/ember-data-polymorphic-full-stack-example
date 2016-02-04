defmodule EmberPaint.ShapeChannel do
  use EmberPaint.Web, :channel

  alias EmberPaint.Shape

  require Logger

  def join(topic, payload, socket) do
    if authorized?(payload) do
      Logger.info "Joining #{topic} channel"
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (shapes:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_in("show", %{"id" => id}, socket) do
    [type, action] = String.split(socket.topic, ":", parts: 2)
    Logger.info "#{action}ing #{type}"

    # require IEx
    # IEx.pry
    shape = Repo.get!(Shape, id)

    {:reply, {:ok, shape}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (shapes:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # This is invoked every time a notification is being broadcast
  # to the client. The default implementation is just to push it
  # downstream but one could filter or change the event.
  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
