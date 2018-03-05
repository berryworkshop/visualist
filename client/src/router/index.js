import Vue from "vue";
import Router from "vue-router";
import Home from "@/components/Home";
import Map from "@/components/Map";
import Calendar from "@/components/Calendar";
import Event from "@/components/calendar/Event";
import Directory from "@/components/Directory";
import Login from "@/components/Login";
import Search from "@/components/Search";
import Sitemap from "@/components/Sitemap";
import Error404 from "@/components/404";
import Error500 from "@/components/500";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "home",
      component: Home
    },
    {
      path: "/map",
      name: "map",
      component: Map
    },
    {
      path: "/calendar",
      name: "calendar",
      component: Calendar
    },
    {
      path: "/calendar/:event_id",
      name: "event",
      component: Event
    },
    {
      path: "/directory",
      name: "directory",
      component: Directory
    },
    {
      path: "/search",
      name: "search",
      component: Search
    },
    {
      path: "/sitemap",
      name: "sitemap",
      component: Sitemap
    },
    {
      path: "/login",
      name: "login",
      component: Login
    },
    {
      path: "/404",
      name: "error404",
      component: Error404
    },
    {
      path: "/500",
      name: "error500",
      component: Error500
    }
  ]
});
