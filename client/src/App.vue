<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: "app"
};
</script>

<style lang="scss">
$link-color: #007bff;
$link-color-hover: #0056b3;

button.link {
  background: none;
  color: $link-color;
  border: none;
  padding: 0;
  font: inherit;
  cursor: pointer;
  text-decoration: none;
  background-color: transparent;
  -webkit-text-decoration-skip: objects;

  &:hover,
  &:focus {
    color: $link-color-hover;
    text-decoration: underline;
    outline: none;
  }
}

nav.controls > * {
  margin-right: 1rem;
}
</style>
