<template>
  <div>
    <h3 v-if="formType === 'add'">Add Event</h3>
    <h3 v-else>Edit Event</h3>
    <div>
      <label for="event-title">Name </label>
      <input type="text"
        name="event-title"
        v-model="proxy.attributes.title"
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
        v-model="proxy.attributes.body"
        placeholder="Provide a description for this Event"
        ></textarea>
    </div>
    <template v-if="formType === 'add'">
      <button name="submit-button"
          v-on:click="submitDone(event)">Submit</button>
      <button name="submit-button"
          v-on:click="submit(event)">Submit and Create Another</button>
    </template>
    <button name="submit-button" v-else
        v-on:click="submitEdit(event)">Submit</button>
    <router-link :to="{name: 'calendar'}">Cancel</router-link>
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
      formType: "add", // or "edit"
      manualSlug: "",
      proxy: {
        id: "",
        attributes: {
          title: "",
          body: "",
          slug: ""
        }
      }
    };
  },
  mixins: [nodecrud],
  computed: {
    event() {
      return {
        id: this.proxy.id,
        attributes: {
          title: this.proxy.attributes.title,
          body: this.proxy.attributes.body,
          slug: this.slug
        }
      };
    },
    /**
     * Slug getters and setters adapt title for slug use
     */
    slug: {
      get: function() {
        if (this.proxy.attributes.slug) {
          return this.proxy.attributes.slug;
        }
        return slugify(this.proxy.attributes.title, slugifyOpts);
      },
      set: function(newSlug) {
        this.proxy.attributes.slug = slugify(newSlug, slugifyOpts);
      }
    }
  },
  async created() {
    // determine whether editing existing event or creating event
    const event_id = this.$route.params["event_id"];
    if (event_id) {
      this.formType = "edit";
      this.proxy = await this.nodeRead("event", event_id);
    }
  },
  methods: {
    /**
     * Creates an Event, stores it, and updates the Calendar array
     */
    async submit(event) {
      await this.nodeAdd("event", event);
      this.$emit("updateEvents");
      this.resetForm();
    },
    async submitDone(event) {
      await this.submit(event);
      this.$router.push({ name: "calendar" });
    },
    async submitEdit(event) {
      await this.nodeEdit("event", event);
      this.$emit("updateEvents");
      this.$router.push({ name: "calendar" });
    },
    /**
     * Resets form data.
     */
    resetForm() {
      this.proxy = {
        id: "",
        attributes: {
          title: "",
          body: "",
          slug: ""
        }
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
