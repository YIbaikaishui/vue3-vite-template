<script setup lang="ts">
import { Button } from '@/components/ui/button'
import { useAppStore } from '@/stores/app'

const app = useAppStore()
</script>

<template>
  <main class="flex min-h-svh flex-col items-center justify-center gap-4">
    <h1 class="scroll-m-20 text-4xl font-extrabold tracking-tight lg:text-5xl">
      {{ app.name }} Web
    </h1>
    <p class="text-muted-foreground">
      Vue 3 + Vite 8 + Tailwind CSS 4 + shadcn-vue + Router + Pinia + Axios
    </p>
    <div class="flex items-center gap-4">
      <Button @click="app.increment">
        Count: {{ app.count }}
      </Button>
      <RouterLink
        to="/about"
        class="text-sm text-muted-foreground underline-offset-4 hover:underline"
      >
        Go to About
      </RouterLink>
    </div>
  </main>
</template>
