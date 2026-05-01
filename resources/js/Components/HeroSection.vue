<template>
  <section class="max-w-5xl mx-auto px-6 pt-40 pb-28">

    <!-- available badge -->
    <div class="inline-flex items-center gap-2 bg-white/[0.04] border border-white/[0.08]
                rounded-full px-4 py-1.5 text-xs text-zinc-400 mb-6 animate-fade-in">
      <span class="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse"></span>
      Open to opportunities
    </div>

    <!-- name label -->
    <p class="text-xs font-semibold tracking-[4px] text-violet-500 uppercase mb-3 animate-fade-in">
      Emmanuel Alonzo
    </p>

    <!-- headline -->
    <h1 class="text-6xl md:text-7xl font-black tracking-tighter text-white leading-[0.95] mb-6 animate-slide-up">
      Full-Stack<br>
      <span class="text-violet-500">Web Developer</span><br>
    </h1>

    <p class="text-zinc-500 text-lg max-w-md leading-relaxed mb-10 font-light animate-slide-up delay-100">
      I build fast, scalable web apps with Laravel, Vue 3,
      Inertia.js &amp; Tailwind CSS — clean code, pixel-perfect UIs.
    </p>

    <!-- tech stack chips -->
    <div class="flex flex-wrap gap-2 mb-10 animate-slide-up delay-200">
      <span v-for="t in stack" :key="t.label"
        class="text-xs border rounded-md px-3 py-1.5 font-medium"
        :class="t.cls">
        {{ t.label }}
      </span>
    </div>

    <!-- cta buttons -->
    <div class="flex gap-4 animate-slide-up delay-300">
      <a href="#work"
        class="bg-violet-600 hover:bg-violet-500 text-white px-7 py-3 rounded-xl
               text-sm font-medium transition-all duration-200 hover:-translate-y-0.5">
        View Projects
      </a>
      <a href="/Emmanuel_Alonzo_CV.pdf"
        class="border border-white/[0.1] hover:bg-white/[0.05] text-zinc-400
               hover:text-white px-7 py-3 rounded-xl text-sm font-medium
               transition-all duration-200 hover:-translate-y-0.5">
        Download CV
      </a>
    </div>
  </section>
</template>

<script setup>
const stack = [
  { label: 'Laravel',    cls: 'border-red-500/20 text-red-400 bg-red-500/5' },
  { label: 'Vue 3',      cls: 'border-emerald-500/20 text-emerald-400 bg-emerald-500/5' },
  { label: 'Tailwind',   cls: 'border-sky-500/20 text-sky-400 bg-sky-500/5' },
  { label: 'Inertia.js', cls: 'border-violet-500/20 text-violet-400 bg-violet-500/5' },
  { label: 'MySQL',      cls: 'border-orange-500/20 text-orange-400 bg-orange-500/5' },
  { label: 'Git',        cls: 'border-zinc-500/20 text-zinc-400 bg-zinc-500/5' },
]
</script>