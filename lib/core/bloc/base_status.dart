enum BaseStatus {
  initial("Iniital"),
  loading("Loading"),
  success("Success"),
  failure("Failure");

  final String name;

  const BaseStatus(this.name);
}
