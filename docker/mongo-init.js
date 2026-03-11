// MongoDB initialization script
// This script runs once when the container is first created.

db = db.getSiblingDB(process.env.MONGO_INITDB_DATABASE || 'newsradar');

// Create application user
db.createUser({
  user: 'newsradar',
  pwd: 'newsradar_dev',
  roles: [{ role: 'readWrite', db: 'newsradar' }]
});

// Create indexes
db.channels.createIndex({ url: 1 }, { unique: true });
db.channels.createIndex({ category: 1 });
db.channels.createIndex({ active: 1 });

db.articles.createIndex({ channelId: 1 });
db.articles.createIndex({ publishedAt: -1 });
db.articles.createIndex({ title: 'text', content: 'text' });
db.articles.createIndex({ iptcCategory: 1 });

db.users.createIndex({ email: 1 }, { unique: true });
db.users.createIndex({ role: 1 });

db.alerts.createIndex({ userId: 1 });
db.alerts.createIndex({ active: 1 });

db.notifications.createIndex({ userId: 1 });
db.notifications.createIndex({ createdAt: -1 });
db.notifications.createIndex({ read: 1 });

print('NewsRadar database initialized successfully.');
