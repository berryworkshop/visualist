<template>
  <div id="node-form">
    <h3 v-if="formType === 'add'">Add {{ type.toTitleCase() }}</h3>
    <h3 v-else>Edit {{ type.toTitleCase() }}: {{ node.attributes.title }}</h3>
    <div>
      <label for="node-title">Title</label>
      <input type="text"
        autofocus
        required
        name="node-title"
        v-model="node.attributes.title"
        :placeholder="`Provide a title for this ${type.toTitleCase()}`">
    </div>
    <div>
      <label for="node-slug">Slug</label>
      <input type="slug"
        required
        name="node-slug"
        v-model="slug"
        :placeholder="`Provide a title for this ${type.toTitleCase()}`">
    </div>
    <div>
      <label for="node-properties">Properties</label>
      <textarea
        name="node-properties"
        rows="5"
        v-model="node.attributes.properties"
        :placeholder="`Provide properties for this ${type.toTitleCase()}, in valid JSON`"
        ></textarea>
    </div>
    <div>
      <label for="node-body">Body</label>
      <textarea
        name="node-body"
        rows="5"
        v-model="node.attributes.body"
        :placeholder="`Provide a description for this ${type.toTitleCase()}`"
        ></textarea>
    </div>

    <nav class="controls">
      <template v-if="formType === 'add'">
        <button name="submit-button"
            v-on:click="submitDone(proxyNode)">Submit {{ type.toTitleCase() }}</button>
        <button name="submit-button"
            v-on:click="submitAndAdd(proxyNode)">Submit and Create Another {{ type.toTitleCase() }}</button>
      </template>
      <button name="submit-button" v-else
          v-on:click="submitEdit(proxyNode)">Submit</button>
      <button name="cancel-button" v-on:click.prevent="$router.go(-1)">Cancel</button>
      <router-link :to="{name: 'calendar'}">Browse {{ type.pluralize().toTitleCase() }}</router-link>

    </nav>
  </div>
</template>

<script>
// eslint-disable-next-line
import utility from "../../utility";
import slugify from "slugify";
import nodecrud from "../../mixins/nodecrud";

const slugifyOpts = {
  replacement: "-",
  lower: true
};

export default {
  name: "node-add",
  data() {
    return {
      formType: "add", // or "edit"
      manualSlug: "",
      node: {
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
  props: {
    type: String
  },
  computed: {
    proxyNode() {
      return {
        id: this.node.id,
        attributes: {
          title: this.node.attributes.title,
          properties: this.node.attributes.properties,
          body: this.node.attributes.body,
          slug: this.slug
        }
      };
    },
    /**
     * Slug getters and setters adapt title for slug use
     */
    slug: {
      get: function() {
        if (this.node.attributes.slug) {
          return this.node.attributes.slug;
        }
        return slugify(this.node.attributes.title, slugifyOpts);
      },
      set: function(newSlug) {
        this.node.attributes.slug = slugify(newSlug, slugifyOpts);
      }
    }
  },
  async created() {
    // determine whether editing existing node or creating node
    const node_id = this.$route.params["node_id"];
    if (node_id) {
      this.formType = "edit";
      this.node = await this.nodeRead("node", node_id);
    }
  },
  methods: {
    /**
     * Creates an Node, stores it, and updates the Calendar array
     */
    async submitAndAdd(node) {
      await this.nodeAdd("node", node);
      this.$emit("updateNodes");
      this.clearForm();
    },
    async submitDone(node) {
      await this.nodeAdd("node", node);
      this.$emit("updateNodes");
      this.$router.push({ name: "calendar" });
    },
    async submitEdit(node) {
      await this.nodeEdit("node", node);
      this.$emit("updateNodes");
      this.$router.push({ name: "calendar" });
    },
    /**
     * Resets form data.
     */
    clearForm() {
      this.node = {
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

textarea[name="node-properties"] {
  font-family: "Courier New", Courier, monospace;
}
</style>
