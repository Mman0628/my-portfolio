<script setup>
import { Link } from '@inertiajs/vue3'
</script>

<template>
  <nav class="fixed top-0 inset-x-0 z-50 bg-[#0c0c12]/80 backdrop-blur-md border-b border-white/[0.05]">
    <div class="max-w-5xl mx-auto px-6 h-16 flex items-center justify-between">
      <Link href="/" class="font-black text-xl text-white tracking-tight font-mono">
        ea<span class="text-violet-500">.</span>dev
      </Link>
      <div class="flex items-center gap-8">
        <a href="#work"    class="text-sm text-zinc-500 hover:text-white transition-colors duration-200">Work</a>
        <a href="#about"   class="text-sm text-zinc-500 hover:text-white transition-colors duration-200">About</a>
        <a href="#contact" class="text-sm text-zinc-500 hover:text-white transition-colors duration-200">Contact</a>
        <a href="#contact"
          class="text-sm bg-violet-600 hover:bg-violet-500 text-white px-5 py-2 rounded-full transition-colors duration-200 font-medium">
          Hire me
        </a>
      </div>
    </div>
  </nav>
</template>