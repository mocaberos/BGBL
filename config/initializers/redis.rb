# redis://:[password]@[hostname]:[port]/[db]
Redis.current = Redis::Namespace.new(:bgbl, redis: Redis.new(url: ENV['BGBL_REDIS_URL']))
