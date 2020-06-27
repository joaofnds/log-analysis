db.getCollection('kong').aggregate([
  {
    $group: {
      _id: '$service.id',
      requests: { $push: '$request' }
    }
  },
  {
    $out: 'requests-per-service'
  }
])