import ENV from "../config/environment";
import { Socket } from "emberpaint/phoenix";

export function initialize(application) {
  const uri = ENV.SocketURI;

  if (uri === undefined || uri === null) {
    console.error("You must specify a `SocketURI` in your config/environment.js file");
  } else {
    const socket = new Socket(uri, {
      logger: ((kind, msg, data) => { console.log(`${kind}: ${msg}`, data) })
    });

    socket.connect({});

    socket.onOpen( ev => console.log("OPEN", ev) );
    socket.onError( ev => console.log("ERROR", ev) );
    socket.onClose( e => console.log("CLOSE", e) );

    socket.joinedChannels = {};

    application.register("store:socket", socket, { instantiate: false });
    application.inject("adapter", "socket", "store:socket");
  }
}

export default {
  name: 'phoenix-adapter',
  after: 'store',
  initialize
};
