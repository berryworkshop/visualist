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
    <button name="submit-button"
        v-on:click="createEvent(event)">Submit</button>
  </div>
</template>

<script>
import slugify from "slugify";
import nodecrud from "../../mixins/nodecrud";

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
      manualSlug: "",
    };
  },
  mixins: [nodecrud],
  methods: {
    /**
     * Creates an Event, stores it, and updates the Calendar array
     */
    async createEvent(event) {
      await this.nodeCreate('event', event);
      this.nodesFetch("event");
      this.resetForm();
    },
    /**
     * Resets form data.
     */
    resetForm() {
      this.title = "";
      this.body = "";
      this.manualSlug = "";
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
