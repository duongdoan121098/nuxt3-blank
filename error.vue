<template>
  <div></div>
</template>
<script>
export default defineComponent({
  name: 'ErrorPage',
  setup() {
    const store = useCounterStore();
    // ✔️ Good:
    const count = computed(() => store.count);

    return { count };
  },
});
</script>
