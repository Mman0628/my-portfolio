<script setup>
import { onMounted } from 'vue'
import Navbar from '@/Components/Navbar.vue'
import HeroSection from '@/Components/HeroSection.vue'
import Footer from '@/Components/Footer.vue'

const services = [
  {
    emoji: '🖥️',
    title: 'Full-Stack Web Apps',
    description: 'End-to-end web applications built with Laravel on the backend and Vue 3 on the frontend — fast, secure, and scalable.',
    color: 'bg-violet-500/10 border-violet-500/20',
  },
  {
    emoji: '⚡',
    title: 'SPA with Inertia.js',
    description: 'Single-page app experience without the API complexity — Inertia bridges Laravel and Vue 3 seamlessly.',
    color: 'bg-sky-500/10 border-sky-500/20',
  },
  {
    emoji: '🎨',
    title: 'UI with Tailwind CSS',
    description: 'Clean, responsive, and modern interfaces built utility-first with Tailwind CSS. Pixel-perfect on every screen.',
    color: 'bg-emerald-500/10 border-emerald-500/20',
  },
  {
    emoji: '🔐',
    title: 'Auth & Roles',
    description: 'User authentication, role-based access control, and permission management using Laravel Breeze or Jetstream.',
    color: 'bg-rose-500/10 border-rose-500/20',
  },
  {
    emoji: '🗄️',
    title: 'Database & APIs',
    description: 'Relational database design with MySQL, Eloquent ORM, and RESTful API development for third-party integrations.',
    color: 'bg-orange-500/10 border-orange-500/20',
  },
  {
    emoji: '🚀',
    title: 'Deployment & Git',
    description: 'Version control with Git, deployment via Railway or shared hosting, and environment configuration for production.',
    color: 'bg-pink-500/10 border-pink-500/20',
  },
]

const stack = [
  { label: 'Laravel',     level: 85, color: 'bg-red-500' },
  { label: 'Vue 3',       level: 80, color: 'bg-emerald-500' },
  { label: 'Inertia.js',  level: 78, color: 'bg-violet-500' },
  { label: 'Tailwind CSS',level: 90, color: 'bg-sky-500' },
  { label: 'MySQL',       level: 75, color: 'bg-orange-500' },
  { label: 'PHP',         level: 82, color: 'bg-indigo-500' },
  { label: 'Git',         level: 80, color: 'bg-zinc-400' },
  { label: 'REST API',    level: 75, color: 'bg-teal-500' },
]

const tools = [
  'PHP', 'Laravel', 'Vue 3', 'Inertia.js', 'Tailwind CSS',
  'Vite', 'Composer', 'NPM', 'MySQL', 'SQLite', 'Eloquent ORM',
  'Laravel Breeze', 'Blade', 'Git', 'GitHub', 'REST API',
  'Postman', 'VS Code',
]

onMounted(() => {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach(el => {
        if (el.isIntersecting) {
          el.target.classList.add('is-visible')
          observer.unobserve(el.target)
        }
      })
    },
    { threshold: 0.1 }
  )
  document.querySelectorAll('.reveal').forEach(el => observer.observe(el))
})
</script>

<template>
  <div class="min-h-screen bg-[#0c0c12]">
    <Navbar />
    <HeroSection />

    <!-- Stats -->
    <section class="max-w-5xl mx-auto px-6 pb-24">
      <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
        <div
          v-for="s in [['1yr+','Experience'],['4','Core Stack'],['PH','Based'],['Open','To Work']]"
          :key="s[0]"
          class="reveal bg-white/[0.02] border border-white/[0.06] rounded-2xl p-6 text-center">
          <p class="text-3xl font-black text-white tracking-tight">{{ s[0] }}</p>
          <p class="text-zinc-600 text-sm mt-1">{{ s[1] }}</p>
        </div>
      </div>
    </section>

    <!-- What I Can Build -->
    <section id="work" class="max-w-5xl mx-auto px-6 pb-24">
      <div class="reveal mb-12">
        <p class="text-xs tracking-[3px] text-zinc-600 uppercase font-semibold mb-3">What I Do</p>
        <h2 class="text-4xl font-black text-white tracking-tight">What I Can Build For You</h2>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-5">
        <div
          v-for="s in services" :key="s.title"
          class="reveal bg-white/[0.02] border border-white/[0.06] rounded-2xl p-6
                 hover:border-violet-500/30 hover:bg-white/[0.04]
                 transition-all duration-300 hover:-translate-y-1">
          <div class="w-10 h-10 rounded-xl flex items-center justify-center text-xl mb-5 border"
               :class="s.color">
            {{ s.emoji }}
          </div>
          <h3 class="font-bold text-white text-base mb-2">{{ s.title }}</h3>
          <p class="text-zinc-600 text-sm leading-relaxed">{{ s.description }}</p>
        </div>
      </div>
    </section>

    <!-- Skill Bars -->
    <section id="skills" class="max-w-5xl mx-auto px-6 pb-24 border-t border-white/[0.05] pt-24">
      <div class="grid grid-cols-1 md:grid-cols-2 gap-16 items-start">

        <div class="reveal">
          <p class="text-xs tracking-[3px] text-zinc-600 uppercase font-semibold mb-3">Proficiency</p>
          <h2 class="text-4xl font-black text-white tracking-tight mb-10">My Skill Levels</h2>
          <div class="space-y-5">
            <div v-for="s in stack" :key="s.label">
              <div class="flex justify-between items-center mb-1.5">
                <span class="text-sm text-zinc-300 font-medium">{{ s.label }}</span>
                <span class="text-xs text-zinc-600">{{ s.level }}%</span>
              </div>
              <div class="h-1.5 bg-white/[0.05] rounded-full overflow-hidden">
                <div
                  class="h-full rounded-full transition-all duration-1000"
                  :class="s.color"
                  :style="{ width: s.level + '%' }">
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="reveal">
          <p class="text-xs tracking-[3px] text-zinc-600 uppercase font-semibold mb-3">Tools & Tech</p>
          <h2 class="text-4xl font-black text-white tracking-tight mb-10">My Toolbox</h2>
          <div class="flex flex-wrap gap-2">
            <span
              v-for="t in tools" :key="t"
              class="text-xs bg-white/[0.03] border border-white/[0.07] rounded-lg
                     px-3 py-2 text-zinc-400 hover:border-violet-500/30
                     hover:text-violet-400 transition-all duration-200 cursor-default">
              {{ t }}
            </span>
          </div>
        </div>

      </div>
    </section>

    <!-- About -->
    <section id="about" class="max-w-5xl mx-auto px-6 pb-24">
      <div class="reveal bg-white/[0.02] border border-white/[0.06] rounded-3xl p-10 md:p-14">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
          <div>
            <p class="text-xs tracking-[3px] text-zinc-600 uppercase font-semibold mb-3">About Me</p>
            <h2 class="text-4xl font-black text-white tracking-tight mb-6">
              Hi, I'm<br>
              <span class="text-violet-500">Emmanuel Alonzo</span>
            </h2>
            <p class="text-zinc-500 leading-relaxed mb-4 font-light">
              I'm a full-stack developer from the Philippines focused on building
              clean, maintainable web applications using the Laravel ecosystem.
            </p>
            <p class="text-zinc-500 leading-relaxed font-light">
              I'm currently growing my skills and looking for my first professional
              opportunity — eager to contribute, learn fast, and deliver real value
              to a great team.
            </p>
          </div>
          <div class="space-y-4">
            <div
              v-for="item in [
                ['🎯','Focus','Laravel + Vue 3 + Inertia.js'],
                ['📍','Location','Philippines'],
                ['💼','Status','Open to work'],
                ['🌐','Language','Filipino & English'],
              ]"
              :key="item[0]"
              class="flex items-center gap-4 bg-white/[0.02] border border-white/[0.06]
                     rounded-xl px-5 py-4">
              <span class="text-xl">{{ item[0] }}</span>
              <div>
                <p class="text-xs text-zinc-600 font-medium">{{ item[1] }}</p>
                <p class="text-sm text-zinc-300">{{ item[2] }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Contact -->
    <section id="contact" class="max-w-5xl mx-auto px-6 pb-28">
      <div class="reveal bg-violet-600/10 border border-violet-500/20 rounded-3xl p-12 text-center">
        <p class="text-xs tracking-[3px] text-violet-400/70 uppercase font-semibold mb-4">Get In Touch</p>
        <h2 class="text-4xl font-black text-white tracking-tight mb-4">
          Let's Work Together
        </h2>
        <p class="text-zinc-500 mb-8 font-light max-w-md mx-auto">
          I'm actively looking for opportunities. Whether it's a freelance
          project or a full-time role — I'd love to hear from you.
        </p>
        <div class="flex justify-center gap-4 flex-wrap">
          <a href="mailto:emmanuel@email.com"
            class="inline-block bg-violet-600 hover:bg-violet-500 text-white
                   px-8 py-3.5 rounded-xl text-sm font-medium
                   transition-all duration-200 hover:-translate-y-0.5">
            Send Me an Email →
          </a>
          <a href="https://linkedin.com/in/yourname" target="_blank"
            class="inline-block border border-white/10 hover:bg-white/[0.05]
                   text-zinc-400 hover:text-white px-8 py-3.5 rounded-xl text-sm
                   font-medium transition-all duration-200 hover:-translate-y-0.5">
            LinkedIn Profile
          </a>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<style>
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(24px); }
  to   { opacity: 1; transform: translateY(0); }
}
.animate-fade-in  { animation: fadeIn .6s ease both; }
.animate-slide-up { animation: fadeIn .7s ease both; }
.delay-100 { animation-delay: .1s; }
.delay-200 { animation-delay: .2s; }
.delay-300 { animation-delay: .3s; }

.reveal {
  opacity: 0;
  transform: translateY(32px);
  transition: opacity .6s ease, transform .6s ease;
}
.reveal.is-visible {
  opacity: 1;
  transform: translateY(0);
}
</style>