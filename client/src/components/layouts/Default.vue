<template>
  <div class="layout">
    <header-default></header-default>
    <main class="container">
      <div id="node" class="row">
        <div class="col py-md-3">
          <slot></slot>
        </div>
      </div>
    </main>
    <footer-default></footer-default>
  </div>
</template>

<script>
import HeaderDefault from "../partials/Header";
import FooterDefault from "../partials/Footer";

export default {
  name: "Layout",
  components: {
    HeaderDefault,
    FooterDefault
  }
};
</script>

<style scoped lang="scss">
.layout {
  display: flex;
  flex-direction: column;
  min-height: 100vh;

  main {
    flex: 1;
    // padding: 1rem;
  }
}
</style>
