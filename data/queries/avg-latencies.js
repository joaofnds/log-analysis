db.getCollection("kong").aggregate([
  {
    $group: {
      _id: "$service.id",
      avg_proxy: { $avg: "$latencies.proxy" },
      avg_kong: { $avg: "$latencies.kong" },
      avg_request: { $avg: "$latencies.request" }
    }
  },
  {
    $out: 'avg-latencies'
  }
])