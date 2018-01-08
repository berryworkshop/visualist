<template>
  <div class="event-add">
    <h3>Add Event</h3>
    <div>
      <label for="event-name">Name </label>
      <input type="text"
        name="event-name"
        v-model="event.name"
        placeholder="Provide a name for this Event">
    </div>
    <div>
      <label for="event-body">Body </label>
      <textarea
        name="event-body"
        rows="5"
        v-model="event.body"
        placeholder="Provide a description for this Event"
        ></textarea>
    </div>

  </div>
</template>

<script>

export default {
  name: 'EventAdd',
  data() {
    return {
      event: {
        name: '',
        body: '',
        categories: [],
        'user-id': null,
        'is-active': null,
        'is-approved': null,
        'is-featured': false,
        'is-public': true,
      },
    };
  },
};
</script>

<style scoped lang="scss">
  textarea {
    width: 100%;
  }
</style>
