<template>
  <div>
    <h3>Browse Events</h3>
    <ul id="event-list" v-if="events && events.length > 0">
      <li class="event" v-for="e in events" :key="e.attributes.slug">
        <div class="data">
          <span class="event-id">{{ e.id }}</span><router-link class="event-link" :to="{name: 'event', params: { event_id: e.id }}">{{ e.attributes.title }}</router-link>
        </div>
        <div class="controls">
          <router-link :to="{
            name: 'eventEdit',
            params: {
              event_id: e.id
            }}">Edit Event</router-link>
          <button name="delete" :value="e" v-on:click="eventDelete(e)">Delete Event</button>
        </div>
      </li>
    </ul>
    <p v-else>No events are available.</p>

    <nav class="controls">
      <router-link :to="{name: 'eventAdd'}">Add Event</router-link>
    </nav>
  </div>
</template>

<script>
// import EventAdd from "./calendar/EventAdd";
import nodecrud from "../../mixins/nodecrud";

export default {
  name: "event-browse",
  components: {
    // Layout,
    // EventAdd
  },
  mixins: [nodecrud],
  computed: {
    events() {
      return this.$store.state.events;
    }
  },
  methods: {
    async eventDelete(event) {
      await this.nodeDelete("event", event);
      this.updateEvents();
    },
    async updateEvents() {
      const json = await this.nodeBrowse("event");
      this.$store.dispatch("storeNodes", {
        type: "event",
        nodes: json
      });
    }
  },
  created() {
    this.updateEvents();
  }
};
</script>

<style lang="scss" scoped>
ul#event-list {
  padding-left: 0;
  list-style-type: none;

  .event {
    display: flex;
    .data {
      flex: 1;
      > * {
        margin-right: 1rem;
      }
    }
    .controls {
      > * {
        margin-left: 1rem;
      }
    }
  }
}
</style>
