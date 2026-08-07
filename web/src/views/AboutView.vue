<script setup lang="ts">
import { Button } from '@/components/ui/button'
</script>

<template>
  <main class="flex min-h-svh flex-col items-center justify-center gap-4">
    <h1 class="scroll-m-20 text-4xl font-extrabold tracking-tight lg:text-5xl">
      About
    </h1>
    <p class="text-muted-foreground">
      A lazy-loaded view using Vue Router.
    </p>
    <Button as-child>
      <RouterLink to="/">Back home</RouterLink>
    </Button>
  </main>
</template>
