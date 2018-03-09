import Vue from "vue";
import Router from "vue-router";
import Home from "@/components/Home";
import Map from "@/components/Map";
import Calendar from "@/components/Calendar";
import Event from "@/components/calendar/Event";
import EventBrowse from "@/components/calendar/EventBrowse";
import EventForm from "@/components/calendar/EventForm";
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
      component: Calendar,
      children: [
        {
          path: "events",
          name: "calendar",
          component: EventBrowse
        },
        {
          path: "events/add",
          name: "eventAdd",
          component: EventForm
        },
        {
          path: "events/:event_id/edit",
          name: "eventEdit",
          component: EventForm
        },
        {
          path: "events/:event_id",
          name: "event",
          component: Event
        }
      ]
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
