import Vue from "vue";
import Router from "vue-router";
import Home from "@/components/Home";
import Map from "@/components/Map";
import Calendar from "@/components/Calendar";
import Directory from "@/components/Directory";
import Node from "@/components/generic/Node";
import NodeBrowse from "@/components/generic/NodeBrowse";
import NodeForm from "@/components/generic/NodeForm";
// import Event from "@/components/calendar/Event";
// import EventBrowse from "@/components/calendar/EventBrowse";
// import EventForm from "@/components/calendar/EventForm";
// import PersonBrowse from "@/components/directory/PersonBrowse";
// import PersonForm from "@/components/directory/PersonForm";
// import Person from "@/components/directory/Person";
// import OrganizationBrowse from "@/components/directory/OrganizationBrowse";
// import OrganizationForm from "@/components/directory/OrganizationForm";
// import Organization from "@/components/directory/Organization";
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
          path: "/events/events",
          name: "calendar",
          component: NodeBrowse,
          props: {
            type: "event"
          }
        },
        {
          path: "/events/add",
          name: "eventAdd",
          component: NodeForm,
          props: {
            type: "event"
          }
        },
        {
          path: "/events/:event_id/edit",
          name: "eventEdit",
          component: NodeForm,
          props: {
            type: "event"
          }
        },
        {
          path: "/events/:event_id",
          name: "event",
          component: Event,
          props: {
            type: "event"
          }
        }
      ]
    },
    {
      path: "/directory",
      name: "directory",
      component: Directory,
      children: [
        {
          path: "/people",
          name: "people",
          component: NodeBrowse,
          props: {
            type: "person"
          }
        },
        {
          path: "/people/add",
          name: "personAdd",
          component: NodeForm,
          props: {
            type: "person"
          }
        },
        {
          path: "/people/:person_id/edit",
          name: "personEdit",
          component: NodeForm,
          props: {
            type: "person"
          }
        },
        {
          path: "/people/:person_id",
          name: "person",
          component: Node,
          props: {
            type: "person"
          }
        },
        {
          path: "/organizations",
          name: "organizations",
          component: NodeBrowse,
          props: {
            type: "organization"
          }
        },
        {
          path: "/organizations/add",
          name: "organizationAdd",
          component: NodeForm,
          props: {
            type: "organization"
          }
        },
        {
          path: "/organizations/:organization_id/edit",
          name: "organizationEdit",
          component: NodeForm,
          props: {
            type: "organization"
          }
        },
        {
          path: "/:organization_id",
          name: "organization",
          component: Node,
          props: {
            type: "organization"
          }
        }
      ]
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
