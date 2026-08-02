class Event {
  final String id;
  final String title;
  final String category;
  final String date;
  final String time;
  final String location;
  final String priceString;
  final double price;
  final String imageUrl;
  final String description;
  final List<String> tags;
  final List<Performer> lineup;
  final String locationDetail;
  final bool isFree;

  const Event({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.location,
    required this.priceString,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.tags,
    required this.lineup,
    required this.locationDetail,
    this.isFree = false,
  });
}

class Performer {
  final String name;
  final String imageUrl;

  const Performer({
    required this.name,
    required this.imageUrl,
  });
}

final List<Event> mockEvents = [
  const Event(
    id: 'atif-aslam',
    title: 'Atif Aslam Live in Lahore',
    category: 'Live Music',
    date: 'Nov 15',
    time: '8:00 PM',
    location: 'Alhamra Cultural Complex',
    priceString: 'PKR 5,000',
    price: 5000.0,
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAXaFGmHf3DsSiZYa1e_TLTNU5tUGbNJ4t0AQoe8RskFeocuf5CQMKvol0JEQyErHiSOQv9lKxLKUTIM4oQPuBmHYUzLgscvQ5iBSdl7lFBox8lIUK94-qRp6DBzBTpBsBl7Bovz20sYTcpa7R-IbEZXCtCbowOh1Du7iJG8CLQFRUVaG9ZjR81oPvVgElHK27zUl54xh8VxOeZvWcSBsi4XPisVJsjLMFiIstC4kPtMIl6LubJA5K-_pmFyHBSZY3uAuJu57Od8mqI',
    description: 'Experience the absolute king of Bollywood and Pakistani music, Atif Aslam, live in a majestic open-air performance in Lahore. Join thousands of fans for a night of beautiful melodies and high-energy hits.',
    tags: ['Music', 'Concert', 'Live'],
    lineup: [
      Performer(
        name: 'Atif Aslam',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAYLM6jgGE-4njouHcLXFT9oAc0D3bWZtZkGkE87zR3cN32OgwF3Vll7UxY_ady6wNOVx80bb-yR56dpTdu4mswQlreyU0DxK5ruHyVBxGrb7abiqCZFJlQ6M6vQ5y1mBrkzawS-Uf2Jga7OWGuYVnEPCU-Se-yH3Lp05AwNrVsOebB-yIAfffPolQkJYpCeXPX9SQnE2WkEEFMEqHzD5LIvpyZPhQYVPqSDGWPhsVBgeorV2X2r9LZvdZ2TSSHCtFWpngpXPHj6YMb',
      )
    ],
    locationDetail: 'Alhamra Open Air Theatre, Mall Road, Lahore',
  ),
  const Event(
    id: 'lums-music-fest',
    title: 'LUMS Music Fest 2024',
    category: 'Festival',
    date: 'Oct 28-29',
    time: '5:00 PM onwards',
    location: 'LUMS Campus',
    priceString: 'PKR 8,500',
    price: 8500.0,
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCbxdRzwKS0yiGWcT8Cba7p1ZjRj3dObuEi3KjIskTpGUCQYPj3AXE8bAFaA9qlEf8Y7xCjvua_PoZqbJb0WO0B0Ygn5bVRT4mqyXw5rclZCQnFVCtWjk8NICVgP4z5iz9cUtsDCz8pslajzBwbvX49L2TpyUx9QjOWS1e9s0HaybC69jPskCWDOziFC9mnNL86Ab51tSgCPrVcK0rsVsB0BdoC7j1Y1QhCJnSDf6hbuJyv5LrawADrGh2t1-9ICBxzAk_seYQgl2HA',
    description: 'The biggest student-run music festival in Pakistan is back. Two days of pure musical bliss featuring indie artists, rock legends, and underground DJs.',
    tags: ['Festival', 'LUMS', 'Gen Z'],
    lineup: [
      Performer(
        name: 'Various Artists',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD818BaJF5rN4DOyVtNQ9v18EgGNB10lnqV_lpK6ZUcbP-dJ5sHMTrmWtbQcL-ururnVckadLcwp59lnC3d3ddM2sGDY6MgYftgT4FK242egln-MszcIBMUNGHVn23ftznQpKlN7ycn-y6R4Hjq29O3QvRadfBdWitvs0wjwrtcLJxpKBwLcwyI3rfSZDqLNnzeQIk3qOQi0gGXv0B7j8LDU9liD7hHlt_xpy3rPnKqy8KdIUyG5F0sgkSsMjHuRSNnPslcL2tHVRH8',
      )
    ],
    locationDetail: 'LUMS, DHA Phase 5, Lahore',
  ),
  const Event(
    id: 'strings-farewell',
    title: 'Strings: The Farewell Tour',
    category: 'Music',
    date: 'Saturday, 25 Nov 2023',
    time: '7:00 PM',
    location: 'Alhamra Open Air Theatre',
    priceString: 'Rs. 2,500',
    price: 2500.0,
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBwuUe3gT78Sha04AvEkmvEg8q2uuNYq-mRWihBLevTnPelr2iWv5lUaxzdtAXx2yq4Ppu5l6y0JGUzb6yR_NFmXRRcNu-IfAucwKMWJ5LqOKmY4sDEhAuBaGlwLkVliABQZrFTfzYUcDw7a18SgtGdNjl-qWI7YIYh7lwIl7YWyX-k8SSr-mze0PNmEnM3mLQ1uDoO0tvLgSW0igCkcD1lWhNjiMoo2sUVZ40xsdB4x-AlqSnbK4oPjs9sfAs7bri0twR7bTZppvOa',
    description: 'Experience the legendary pop-rock band one last time in an unforgettable, cinematic performance spanning three decades of music.\n\nJoin us for an evening of pure nostalgia as Strings takes the stage for their final, highly anticipated farewell tour. Set against the stunning backdrop of the open-air theatre, this concert promises an immersive visual and auditory journey through their greatest hits.\n\nExpect a state-of-the-art cinematic stage design, utilizing vast LED screens and breathtaking lighting choreography that blends seamlessly with the night sky. This isn\'t just a concert; it\'s a celebration of a musical legacy.',
    tags: ['Music', 'Live Band', 'Farewell'],
    lineup: [
      Performer(
        name: 'Faisal Kapadia',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAYLM6jgGE-4njouHcLXFT9oAc0D3bWZtZkGkE87zR3cN32OgwF3Vll7UxY_ady6wNOVx80bb-yR56dpTdu4mswQlreyU0DxK5ruHyVBxGrb7abiqCZFJlQ6M6vQ5y1mBrkzawS-Uf2Jga7OWGuYVnEPCU-Se-yH3Lp05AwNrVsOebB-yIAfffPolQkJYpCeXPX9SQnE2WkEEFMEqHzD5LIvpyZPhQYVPqSDGWPhsVBgeorV2X2r9LZvdZ2TSSHCtFWpngpXPHj6YMb',
      ),
      Performer(
        name: 'Bilal Maqsood',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD818BaJF5rN4DOyVtNQ9v18EgGNB10lnqV_lpK6ZUcbP-dJ5sHMTrmWtbQcL-ururnVckadLcwp59lnC3d3ddM2sGDY6MgYftgT4FK242egln-MszcIBMUNGHVn23ftznQpKlN7ycn-y6R4Hjq29O3QvRadfBdWitvs0wjwrtcLJxpKBwLcwyI3rfSZDqLNnzeQIk3qOQi0gGXv0B7j8LDU9liD7hHlt_xpy3rPnKqy8KdIUyG5F0sgkSsMjHuRSNnPslcL2tHVRH8',
      )
    ],
    locationDetail: 'Alhamra Open Air Theatre, Lahore',
  ),
  const Event(
    id: 'pakathon-pitch',
    title: 'Pakathon Pitch Day 2024',
    category: 'Tech',
    date: 'Tomorrow',
    time: '10:00 AM',
    location: 'NIC Lahore',
    priceString: 'Free RSVP',
    price: 0.0,
    isFree: true,
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAS2BeSklI6Pj5hL5JPedT3Ygh9-SNZlgwyY22HYZJ6MI3nmfPjNhssFC6WdBT9ZF1dj8ICTKivQNEJvkDrp5f_rFlZqkL9hhSI-uHE6qnBDdKtFW47_fVj4eYUt4uw7778fMOkKo3SevEIZpoMgmqTXJGtnP1C2v--pOw_ptoNQCLAJXz7VCW6HOnB8yRUjukA_sYOWTE-Y_RQPB_IT9ItTj7Sg9hrjrER4OfaVB1t7xwAr_VIqXrWqGCdPD_9teFPrh_3LNUELaLJ',
    description: 'Watch the top 10 startups from across Pakistan pitch their disruptive ideas to global investors. Network with founders, VCs, and tech enthusiasts.',
    tags: ['Tech', 'Startup', 'Pitch'],
    lineup: [
      Performer(
        name: 'NIC Lahore Panel',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCB0-Hy-TPeIWKUAEkC9pbBzy_2hqo9VzxJqwvc_6aYALfR-L8PcXrq1zrhW2a04SvesJJrXi8KaQZl7XYY4hQsyQp6RC6bHxOZyG4IknU7_Zb2JxrmZAKyDBjkXnOsc1STKL-S8pLvN6wyVwROj-woUW2xSn5XJc8FwvGnOEGwn39eSM5j3jhixYffSA7RS9-xQaeNoo6vK83k6QJdHw7vCJUuPzw3ZhMgZB9KKZs3jv4TdJ35Sr_AUwVsGIzQehWUDgaCWOsVT9cS',
      )
    ],
    locationDetail: 'National Incubation Center, Lahore',
  ),
  const Event(
    id: 'laugh-riot',
    title: 'Laugh Riot: Underground Edition',
    category: 'Comedy',
    date: 'Sat, Nov 18',
    time: '8:00 PM',
    location: 'The Colony',
    priceString: 'PKR 1,500',
    price: 1500.0,
    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAmliWilEHX6RJMlSE0LIdVoCk04mHL0sQA8hlNzRfb3WrBX6j-wGwRMopoOUSjhlqDP_FlfpxQJsyUZSWQgxeoBA7nDh4An_4uahefuW4R44lA7FlbbjiAUUtELrS4HcklC8dhZZsO-5j9RSph0qLSusPhbn6o6plIIU4abebtvNk9ZGZBmLxFNwXQZVkiQWAixY_ysJnd5UWrfpzplK-7_A_LfSaSqd90niokzzNt9lIGPvHSQhlZevZjUJOMq2eEmzLy9UD69qpO',
    description: 'An exclusive evening featuring the rising stars of Lahore\'s underground standup comedy scene. Get ready for unfiltered jokes and high-intensity humor in an intimate setting.',
    tags: ['Comedy', 'Underground', 'Standup'],
    lineup: [
      Performer(
        name: 'Various Comics',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAYLM6jgGE-4njouHcLXFT9oAc0D3bWZtZkGkE87zR3cN32OgwF3Vll7UxY_ady6wNOVx80bb-yR56dpTdu4mswQlreyU0DxK5ruHyVBxGrb7abiqCZFJlQ6M6vQ5y1mBrkzawS-Uf2Jga7OWGuYVnEPCU-Se-yH3Lp05AwNrVsOebB-yIAfffPolQkJYpCeXPX9SQnE2WkEEFMEqHzD5LIvpyZPhQYVPqSDGWPhsVBgeorV2X2r9LZvdZ2TSSHCtFWpngpXPHj6YMb',
      )
    ],
    locationDetail: 'The Colony, Lahore',
  ),
];
