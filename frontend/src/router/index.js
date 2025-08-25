import { createRouter, createWebHistory } from 'vue-router'
import store from '../store'

const routes = [
  {
    path: '/',
    name: 'Landing',
    component: () => import('@/views/LandingPageView.vue'),
    meta: { 
      transition: 'fade',
      requiresAuth: false 
    }
  },
  // Product category components (kept in /components)
  {
    path: '/mens',
    name: 'Mens',
    component: () => import('@/components/MensProduct.vue'),
    meta: { 
      transition: 'slide-up',
      requiresAuth: false 
    }
  },
  {
    path: '/womens',
    name: 'Womens',
    component: () => import('@/components/WomensProduct.vue'),
    meta: { 
      transition: 'slide-up',
      requiresAuth: false 
    }
  },
  {
    path: '/kids',
    name: 'Kids',
    component: () => import('@/components/KidsProduct.vue'),
    meta: { 
      transition: 'slide-up',
      requiresAuth: false 
    }
  },
  // Information components (kept in /components)
  {
    path: '/aboutus',
    name: 'AboutUs',
    component: () => import('@/components/AboutUs.vue'),
    meta: { 
      transition: 'slide-up',
      requiresAuth: false 
    }
  },
  {
    path: '/contactUs',
    name: 'ContactUs',
    component: () => import('@/components/ContactUs.vue'),
    meta: { 
      transition: 'slide-up',
      requiresAuth: false 
    }
  },
  // Policy components (kept in /components)
  {
    path: '/shippingPolicy',
    name: 'ShippingPolicy',
    component: () => import('@/components/ShippingPolicy.vue'),
    meta: { 
      transition: 'slide-up',
      requiresAuth: false 
    }
  },
  {
    path: '/returns',
    name: 'Returns',
    component: () => import('@/components/ReturnsComp.vue'),
    meta: { 
      transition: 'slide-up',
      requiresAuth: false 
    }
  },
  {
    path: '/TermsAndConditions',
    name: 'TermsAndConditions',
    component: () => import('@/components/TermsAndConditions.vue'),
    meta: { 
      transition: 'slide-up',
      requiresAuth: false 
    }
  },
  // Auth routes (fixed paths)
  {
    path: '/reset-password/:token',
    name: 'ResetPassword',
    component: () => import('@/views/ResetPassword.vue'),
    meta: {
      transition: 'slide-up',
      requiresGuest: true
    }
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/components/Login.vue'),
    meta: { 
      transition: 'slide-up',
      requiresGuest: true 
    }
  },
  {
    path: '/forgot-password',
    name: 'ForgotPassword',
    component: () => import('@/components/ForgotPassword.vue'),
    meta: {
      transition: 'slide-up',
      requiresGuest: true
    }
  },
  {
    path: '/signup',
    name: 'Signup',
    component: () => import('@/views/SignupView.vue'),
    meta: {
      transition: 'slide-up',
      requiresGuest: true
    }
  },
  {
    path: '/checkout',
    name: 'Checkout',
    component: () => import('@/components/Checkout.vue'), // Changed from @/views/Checkout.vue
    meta: { 
      transition: 'slide-up',
      requiresAuth: true 
    }
  },
  // Catch-all route
  {
    path: '/:pathMatch(.*)*',
    redirect: '/'
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
  scrollBehavior() {
    return { top: 0 }
  }
})

// Authentication guard (unchanged)
router.beforeEach((to, from, next) => {
  const isAuthenticated = store.getters.isAuthenticated

  if (to.meta.requiresAuth && !isAuthenticated) {
    next({ name: 'Login', query: { redirect: to.fullPath } })
  } else if (to.meta.requiresGuest && isAuthenticated) {
    next('/')
  } else {
    next()
  }
})

export default router