<template>
  <div>
    <h3 v-if="formType === 'add'">Add Event</h3>
    <h3 v-else>Edit Event: {{ event.attributes.title }}</h3>
    <div>
      <label for="event-title">Title</label>
      <input type="text"
        autofocus
        required
        name="event-title"
        v-model="event.attributes.title"
        placeholder="Provide a title for this Event">
    </div>
    <div>
      <label for="event-slug">Slug</label>
      <input type="slug"
        required
        name="event-slug"
        v-model="slug"
        placeholder="Provide a slug for this Event">
    </div>
    <div>
      <label for="event-properties">Properties</label>
      <textarea
        name="event-properties"
        rows="5"
        v-model="event.attributes.properties"
        placeholder="Provide properties for this Event, in valid JSON"
        ></textarea>
    </div>
    <div>
      <label for="event-body">Body</label>
      <textarea
        name="event-body"
        rows="5"
        v-model="event.attributes.body"
        placeholder="Provide a description for this Event"
        ></textarea>
    </div>

    <nav class="controls">
      <template v-if="formType === 'add'">
        <button name="submit-button"
            v-on:click="submitDone(proxyEvent)">Submit</button>
        <button name="submit-button"
            v-on:click="submitAndAdd(proxyEvent)">Submit and Create Another</button>
      </template>
      <button name="submit-button" v-else
          v-on:click="submitEdit(proxyEvent)">Submit</button>
      <button name="cancel-button" v-on:click.prevent="$router.go(-1)">Cancel</button>
      <router-link :to="{name: 'calendar'}">Browse Events</router-link>

    </nav>
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
      event: {
        id: "",
        attributes: {
          title: "",
          properties: "",
          body: "",
          slug: ""
        }
      }
    };
  },
  mixins: [nodecrud],
  computed: {
    proxyEvent() {
      return {
        id: this.event.id,
        attributes: {
          title: this.event.attributes.title,
          properties: this.event.attributes.properties,
          body: this.event.attributes.body,
          slug: this.slug
        }
      };
    },
    /**
     * Slug getters and setters adapt title for slug use
     */
    slug: {
      get: function() {
        if (this.event.attributes.slug) {
          return this.event.attributes.slug;
        }
        return slugify(this.event.attributes.title, slugifyOpts);
      },
      set: function(newSlug) {
        this.event.attributes.slug = slugify(newSlug, slugifyOpts);
      }
    }
  },
  async created() {
    // determine whether editing existing event or creating event
    const event_id = this.$route.params["event_id"];
    if (event_id) {
      this.formType = "edit";
      this.event = await this.nodeRead("event", event_id);
    }
  },
  methods: {
    /**
     * Creates an Event, stores it, and updates the Calendar array
     */
    async submitAndAdd(event) {
      await this.nodeAdd("event", event);
      this.$emit("updateEvents");
      this.clearForm();
    },
    async submitDone(event) {
      await this.nodeAdd("event", event);
      this.$emit("updateEvents");
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
    clearForm() {
      this.event = {
        id: "",
        attributes: {
          title: "",
          properties: "",
          body: "",
          slug: ""
        }
      };
    }
  }
};
</script>

<style scoped lang="scss">
textarea {
  width: 100%;
}

textarea[name="event-properties"] {
  font-family: 'Courier New', Courier, monospace;
}
</style>
