import ActiveModelAdapter from 'active-model-adapter';

export default ActiveModelAdapter.extend({
  host: 'http://localhost:3009',

  findRecord(store, type, id, snapshot) {
    let channel = this.socket.channel("shapes:lobby", {});

    channel.join();

    return this.ajax(this.buildURL(type.modelName, id, snapshot, 'findRecord'), 'GET');
  }
});
