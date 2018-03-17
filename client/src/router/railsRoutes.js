const routes = [
  {
    name: "nodes",
    path: `/nodes`
  },
  {
    name: "node",
    path: `/nodes/` // + ${id}
  },
  {
    name: "events",
    path: `/events`
  },
  {
    name: "event",
    path: `/events/` // + ${id}
  },
  {
    name: "works",
    path: `/works`
  },
  {
    name: "work",
    path: `/works/` // + ${id}
  },
  {
    name: "places",
    path: `/places`
  },
  {
    name: "place",
    path: `/places/` // + ${id}
  },
  {
    name: "agents",
    path: `/agents`
  },
  {
    name: "agent",
    path: `/agents/` // + ${id}
  },
  {
    name: "organizations",
    path: `/organizations`
  },
  {
    name: "organization",
    path: `/organizations/` // + ${id}
  },
  {
    name: "people",
    path: `/people`
  },
  {
    name: "person",
    path: `/people/` // + ${id}
  },
  {
    name: "pages",
    path: `/pages`
  },
  {
    name: "page",
    path: `/pages/` // + ${id}
  },
  {
    name: "edges",
    path: `/edges`
  },
  {
    name: "edge",
    path: `/edges/` // + ${id}
  }
];

export default {
  getPath(name) {
    const item = routes.find(route => {
      return route.name === name;
    });
    return item.path;
  }
};
