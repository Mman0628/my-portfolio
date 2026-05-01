<script setup>
defineProps(['title', 'description', 'tags', 'github', 'live', 'emoji', 'color'])
</script>

<template>
  <div class="reveal group bg-white/[0.02] border border-white/[0.06] rounded-2xl p-6
              hover:border-violet-500/30 hover:bg-white/[0.04]
              transition-all duration-300 hover:-translate-y-1">
    <div class="w-10 h-10 rounded-xl flex items-center justify-center text-xl mb-5 border"
         :class="color">
      {{ emoji }}
    </div>
    <h3 class="font-bold text-white text-base mb-2">{{ title }}</h3>
    <p class="text-zinc-600 text-sm leading-relaxed mb-4">{{ description }}</p>
    <div class="flex flex-wrap gap-2 mb-5">
      <span v-for="t in tags" :key="t"
        class="text-xs bg-white/[0.03] border border-white/[0.07] rounded px-2 py-0.5 text-zinc-500">
        {{ t }}
      </span>
    </div>
    <div class="flex gap-5">
      <a :href="github" class="text-xs text-violet-400 hover:text-violet-300 transition-colors font-medium">
        GitHub →
      </a>
      <a :href="live" class="text-xs text-zinc-600 hover:text-zinc-400 transition-colors">
        Live Demo →
      </a>
    </div>
  </div>
</template>