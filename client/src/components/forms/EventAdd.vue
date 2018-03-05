<template>
  <div class="event-add">
    <h3>Add Event</h3>
    <div>
      <label for="event-title">Name </label>
      <input type="text"
        name="event-title"
        v-model="title"
        placeholder="Provide a title for this Event">
    </div>
    <div>
      <label for="event-slug">Slug </label>
      <input type="slug"
        name="event-slug"
        v-model="slug"
        placeholder="Provide a slug for this Event">
    </div>
    <div>
      <label for="event-body">Body </label>
      <textarea
        name="event-body"
        rows="5"
        v-model="body"
        placeholder="Provide a description for this Event"
        ></textarea>
    </div>
    <button name="user-button"
        v-on:click="createEventAndUpdate(event)">Submit</button>
  </div>
</template>

<script>
import slugify from "slugify";

const slugifyOpts = {
  replacement: "-",
  lower: true
};

export default {
  name: "event-add",
  data() {
    return {
      title: "",
      body: "",
      manualSlug: ""
    };
  },
  methods: {
    /**
     * Creates an Event, stores it, and updates the Calendar array
     */
    createEventAndUpdate(event) {
      this.$store.dispatch('nodeCreate', {
          node: event,
          type: 'event'
      })
      this.$store.dispatch(`nodesFetch`, { type: "event" });
    }
  },
  computed: {
    event() {
      return {
        attributes: {
          title: this.title,
          body: this.body,
          slug: this.slug
        }
      };
    },
    slug: {
      get: function() {
        if (this.manualSlug) {
          return this.manualSlug;
        }
        return slugify(this.title, slugifyOpts);
      },
      set: function(newSlug) {
        this.manualSlug = slugify(newSlug, slugifyOpts);
      }
    }
  }
};
</script>

<style scoped lang="scss">
textarea {
  width: 100%;
}
</style>
