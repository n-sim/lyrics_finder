class Optional<T>{
  T value;

  Optional._(this.value);



  bool isEmpty(){
    return this.value == null ? true : false;
  }

  T get(){
    return value;
  }

  static Optional<T> empty<T>(){
    return Optional._(null);
  }

  static Optional<T> of<T>(T value){
    return Optional._(value);
  }
}