import Vue from 'vue';
import Router from 'vue-router';
import Home from '@/components/Home';
import Map from '@/components/Map';
import Calendar from '@/components/Calendar';
import Directory from '@/components/Directory';
import Pages from '@/components/Pages';
import Login from '@/components/Login';
import Search from '@/components/Search';
import Error404 from '@/components/404';
import Error500 from '@/components/500';

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home,
    },
    {
      path: '/map',
      name: 'Map',
      component: Map,
    },
    {
      path: '/calendar',
      name: 'Calendar',
      component: Calendar,
    },
    {
      path: '/directory',
      name: 'Directory',
      component: Directory,
    },
    {
      path: '/pages',
      name: 'Pages',
      component: Pages,
    },
    {
      path: '/search',
      name: 'Search',
      component: Search,
    },
    {
      path: '/login',
      name: 'Login',
      component: Login,
    },
    {
      path: '/404',
      name: 'Error404',
      component: Error404,
    },
    {
      path: '/500',
      name: 'Error500',
      component: Error500,
    },
  ],
});
