puts 'Creating feature tasks for the project...'

Task.destroy_all

Task.create!([
  {
    title: 'Add user authentication',
    description: 'Use Devise + JWT to authenticate users and protect routes',
    status: 'in_progress',
    due_date: Date.today + 5.days
  },
  {
    title: 'Add pagination to task listing',
    description: 'Use the Kaminari gem to paginate the /tasks endpoint',
    status: 'in_progress',
    due_date: Date.today + 2.days
  },
  {
    title: 'Create background job for overdue tasks',
    description: 'Use Sidekiq to check daily for tasks past due and update their status',
    status: 'completed',
    due_date: Date.today - 1.day
  },
  {
    title: 'Implement task prioritization',
    description: 'Add a priority field (low, medium, high) to help sort important tasks',
    status: 'in_progress',
    due_date: Date.today + 3.days
  },
  {
    title: 'Add comments to tasks',
    description: 'Allow users to post comments on each task (has_many association)',
    status: 'canceled',
    due_date: nil
  },
  {
    title: 'Create admin dashboard',
    description: 'Expose statistics like task completion rate and total overdue',
    status: 'in_progress',
    due_date: Date.today + 10.days
  },
  {
    title: 'Add soft delete using discarded gem',
    description: 'Replace the manual canceled status logic with a soft delete approach',
    status: 'overdue',
    due_date: Date.today - 4.days
  },
  {
    title: 'Write request specs with RSpec',
    description: 'Ensure all API endpoints are covered with tests',
    status: 'completed',
    due_date: Date.today - 2.days
  }
])

puts '✅ Feature-related tasks created!'
