<template>
  <div class="event-add">
    <h3>Add Event</h3>
    <div>
      <label for="event-name">Name </label>
      <input type="text"
        name="event-name"
        v-model="event.attributes.name"
        placeholder="Provide a name for this Event">
    </div>
    <div>
      <label for="event-body">Body </label>
      <textarea
        name="event-body"
        rows="5"
        v-model="event.attributes.body"
        placeholder="Provide a description for this Event"
        ></textarea>
    </div>
    <button name="user-button"
        v-on:click="$store.dispatch('eventCreate', eventSerialized)">Submit</button>
  </div>
</template>

<script>

export default {
  name: 'EventAdd',
  data() {
    return {
      event: {
        type: 'events',
        attributes: {
          name: '',
          body: '',
        },
      },
    };
  },
  computed: {
    eventSerialized() {
      return this.event;
    },
  },
};
</script>

<style scoped lang="scss">
  textarea {
    width: 100%;
  }
</style>
