sealed class Event {}

class ApplicationEvent extends Event {}

class ConcreteGradeEvent extends Event {}

class EmployeeEvent extends Event {}

class ApplicationCreatedEvent extends ApplicationEvent {}

class ApplicationUpdatedEvent extends ApplicationEvent {}

class ConcreteGradeUpdatedEvent extends ConcreteGradeEvent {}

class ConcreteGradeCreatedEvent extends ConcreteGradeEvent {}

class EmployeeCreatedEvent extends ConcreteGradeEvent {}
