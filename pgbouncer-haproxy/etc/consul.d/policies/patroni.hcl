node_prefix "" {
  policy = "read"
}
node_prefix "consul" {
  policy = "write"
}
service_prefix "" {
  policy = "read"
}
service "postgres" {
  policy = "write"
}
