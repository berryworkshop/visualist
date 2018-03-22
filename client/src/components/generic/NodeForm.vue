<template>
  <div id="node-form">
    <h3 v-if="formType === 'add'">Add {{ label }}</h3>
    <h3 v-else>Edit {{ label }}: {{ node.attributes.title }}</h3>
    <div>
      <label for="node-title">Title</label>
      <input type="text"
        autofocus
        required
        name="node-title"
        v-model="node.attributes.title"
        :placeholder="`Provide a title for this ${label}`">
    </div>
    <div>
      <label for="node-slug">Slug</label>
      <input type="slug"
        required
        name="node-slug"
        v-model="slug"
        :placeholder="`Provide a title for this ${label}`">
    </div>

    <div>
      <button name="add-website" v-on:click="addWebsite()">Add Website</button>
      <ul v-if="node.attributes.properties.websites">
        <li v-for="(s, index) in node.attributes.properties.websites"
            :key="index">
          <label for="website-url">Url</label>
          <input type="url"
            required
            name="website-url"
            v-model="s.url"
            :placeholder="`Provide a url`">
        </li>
      </ul>
    </div>

    <div>
      <label for="node-body">Body</label>
      <textarea
        name="node-body"
        rows="5"
        v-model="node.attributes.body"
        :placeholder="`Provide a description for this ${label}`"
        ></textarea>
    </div>

    <nav class="controls">
      <template v-if="formType === 'add'">
        <button name="submit-button"
            v-on:click="submitDone(proxyNode)">Submit {{ label }}</button>
        <button name="submit-button"
            v-on:click="submitAndAdd(proxyNode)">Submit and Create Another {{ label }}</button>
      </template>
      <button name="submit-button" v-else
          v-on:click="submitEdit(proxyNode)">Submit</button>
      <button name="cancel-button" v-on:click.prevent="$router.go(-1)">Cancel</button>
      <router-link :to="{name: label.toLowerCase().pluralize()}">Browse {{ label.toLowerCase().pluralize().toTitleCase() }}</router-link>

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
          label: this.label,
          properties: {
            websites: []
          },
          body: "",
          slug: ""
        }
      }
    };
  },
  mixins: [nodecrud],
  props: {
    label: {
      type: String,
      required: true
    }
  },
  computed: {
    proxyNode() {
      return {
        id: this.node.id,
        attributes: {
          title: this.node.attributes.title,
          label: this.node.attributes.label,
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
    const node_id = this.$route.params[`node_id`];
    if (node_id) {
      this.formType = "edit";
      this.node = await this.nodeRead(node_id);
    }
  },
  methods: {
    /**
     * Creates an Node, stores it, and updates the collection array
     */
    async submitAndAdd(node) {
      await this.nodeAdd(node);
      this.$emit("updateNodes");
      this.clearForm();
    },
    async submitDone(node) {
      await this.nodeAdd(node);
      this.$emit("updateNodes");
      this.$router.push({ name: this.label.toLowerCase().pluralize() });
    },
    async submitEdit(node) {
      await this.nodeEdit(node);
      this.$emit("updateNodes");
      this.$router.push({ name: this.label.toLowerCase().pluralize() });
    },
    /**
     * Resets form data.
     */
    clearForm() {
      this.node = {
        id: "",
        attributes: {
          title: "",
          label: this.label,
          properties: {
            websites: []
          },
          body: "",
          slug: ""
        }
      };
    },
    addWebsite() {
      if (!this.node.attributes.properties.websites) {
        this.$set(this.node.attributes.properties, "websites", []);
      }
      this.node.attributes.properties.websites.push({
        url: ""
      });
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
