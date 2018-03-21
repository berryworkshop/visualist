import Vue from "vue";
import Router from "vue-router";
import Home from "@/components/Home";
import Map from "@/components/Map";
import Calendar from "@/components/Calendar";
import Directory from "@/components/Directory";
import Node from "@/components/generic/Node";
import NodeBrowse from "@/components/generic/NodeBrowse";
import NodeForm from "@/components/generic/NodeForm";
import AgentBrowse from "@/components/directory/AgentBrowse";
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
      path: "/map/",
      component: Map,
      children: [
        {
          path: "/map/",
          name: "places",
          component: NodeBrowse,
          props: {
            label: "Place"
          }
        },
        {
          path: "/map/places/add",
          name: "placeAdd",
          component: NodeForm,
          props: {
            label: "Place"
          }
        },
        {
          path: "/map/places/:node_id/edit",
          name: "placeEdit",
          component: NodeForm,
          props: {
            label: "Place"
          }
        },
        {
          path: "/map/places/:node_id",
          name: "place",
          component: Node,
          props: {
            label: "Place"
          }
        }
      ]
    },
    {
      path: "/calendar/",
      component: Calendar,
      children: [
        {
          path: "/calendar/",
          name: "events",
          component: NodeBrowse,
          props: {
            label: "Event"
          }
        },
        {
          path: "/calendar/events/add",
          name: "eventAdd",
          component: NodeForm,
          props: {
            label: "Event"
          }
        },
        {
          path: "/calendar/events/:node_id/edit",
          name: "eventEdit",
          component: NodeForm,
          props: {
            label: "Event"
          }
        },
        {
          path: "/calendar/events/:node_id",
          name: "event",
          component: Node,
          props: {
            label: "Event"
          }
        }
      ]
    },
    {
      path: "/directory/",
      component: Directory,
      children: [
        {
          path: "/directory",
          name: "agents",
          component: AgentBrowse,
          props: {
            label: "Agent"
          }
        },
        {
          path: "/directory/people",
          name: "people",
          component: NodeBrowse,
          props: {
            label: "Person"
          }
        },
        {
          path: "/directory/people/add",
          name: "personAdd",
          component: NodeForm,
          props: {
            label: "Person"
          }
        },
        {
          path: "/directory/people/:node_id/edit",
          name: "personEdit",
          component: NodeForm,
          props: {
            label: "Person"
          }
        },
        {
          path: "/directory/people/:node_id",
          name: "person",
          component: Node,
          props: {
            label: "Person"
          }
        },
        {
          path: "/directory/organizations",
          name: "organizations",
          component: NodeBrowse,
          props: {
            label: "Organization"
          }
        },
        {
          path: "/directory/organizations/add",
          name: "organizationAdd",
          component: NodeForm,
          props: {
            label: "Organization"
          }
        },
        {
          path: "/directory/organizations/:node_id/edit",
          name: "organizationEdit",
          component: NodeForm,
          props: {
            label: "Organization"
          }
        },
        {
          path: "/directory/organizations/:node_id",
          name: "organization",
          component: Node,
          props: {
            label: "Organization"
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
