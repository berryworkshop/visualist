import Vue from 'vue';
import Router from 'vue-router';
import Home from '@/components/Home';
import Calendar from '@/components/Calendar';

Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home,
    },
    {
      path: '/calendar',
      name: 'Calendar',
      component: Calendar,
    },
  ],
});
