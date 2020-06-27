db.getCollection('kong').aggregate([
  {
    $group: {
      _id: '$authenticated_entity.consumer_id.uuid',
      requests: { $push: '$request' }
    }
  },
  {
    $out: 'requests-per-customer'
  }
])