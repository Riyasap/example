class EventModel {
  EventModel({required this.eventUrl, required this.imgUrl});
  String eventUrl;
  String imgUrl;


  static List<EventModel> eventList() { return[
    EventModel(
        eventUrl: "event1",
        imgUrl:
            "https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80"),
    EventModel(
        eventUrl: "event2",
        imgUrl:
            "https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
    EventModel(eventUrl: "event3", imgUrl: "https://images.unsplash.com/photo-1512820790803-83ca734da794?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1198&q=80"),
    EventModel(eventUrl: "event4", imgUrl: "https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80"),
    EventModel(
        eventUrl: "event5",
        imgUrl:"https://images.unsplash.com/photo-1635277568031-f84f54257abc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80"),
    EventModel(eventUrl: "event6", imgUrl:
    "https://images.unsplash.com/photo-1635098996035-e5629025892a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80"),
    EventModel(eventUrl: "event7", imgUrl:
        "https://images.unsplash.com/photo-1635099063953-c0b42432ff21?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80"
    ),
  ];}
}
