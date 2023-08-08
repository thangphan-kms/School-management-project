raise include Errors::StandardError.new(
  title: 'Custom Error Title',
  detail: 'This is a custom error message.',
  status: 401,
  source: { pointer: '/request/path' }
)
