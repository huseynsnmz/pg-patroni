node_prefix "" {
  policy = "read"
}
node "consul-a" {
  policy = "write"
}
service_prefix "" {
  policy = "read"
}
