//  api.swift
//  Class105
//  Created by Weeraphot Bumbaugh on 8/6/25.

//func getItems() -> [PersistentBook] {
//    return [
//        // --- Originals ---
//        PersistentBook(
//            title: "The Fellowship of the Ring",
//            author: "J.R.R. Tolkien",
////            imageData: "book1",
//            summary: "The first book in the Lord of the Rings trilogy, where Frodo begins his perilous journey to destroy the One Ring. It introduces the Fellowship and the vast world of Middle-earth.",
//            rating: 4,
//            review: "A classic tale of good vs evil, a little slow at first but very rewarding.",
//            status: .finished,
//            genre: .fantasy,
//            isFavorite: true
//        ),
//        Book(
//            title: "The Two Towers",
//            author: "J.R.R. Tolkien",
//            image: "book2",
//            description: "The second book in the trilogy, where the Fellowship is broken but continues the fight against Sauron. Highlights include Helm’s Deep, the journey of Frodo and Sam, and the rise of the Ents.",
//            rating: 4,
//            review: "Gets more interesting, love the Ents.",
//            status: .finished,
//            genre: .fantasy,
//            isFavorite: true
//        ),
//        Book(
//            title: "The Return of The King",
//            author: "J.R.R. Tolkien",
//            image: "book3",
//            description: "The final installment of the Lord of the Rings trilogy, concluding the quest to destroy the One Ring and the great battles for Middle-earth. Themes of courage, loyalty, and hope shine here.",
//            rating: 5,
//            review: "A masterpiece, don't have words to describe it.",
//            status: .reading,
//            genre: .fantasy,
//            isFavorite: true
//        ),
//        Book(
//            title: "1984",
//            author: "George Orwell",
//            image: "1984",
//            description: "A dystopian novel set in a totalitarian society under constant surveillance by Big Brother. Explores themes of censorship, propaganda, and loss of individual freedom.",
//            rating: 5,
//            review: "Chilling, powerful, and still relevant today. Makes you think about government control and freedom.",
//            status: .finished,
//            genre: .dystopian,
//            isFavorite: true
//        ),
//        Book(
//            title: "Dune",
//            author: "Frank Herbert",
//            image: "dune",
//            description: "An epic science fiction saga set on the desert planet of Arrakis. Follows Paul Atreides as he navigates political intrigue, betrayal, and prophecy while the fate of the universe hangs in the balance.",
//            rating: 5,
//            review: "Dense but worth it. Incredible worldbuilding and unforgettable story.",
//            status: .reading,
//            genre: .scifi,
//            isFavorite: true
//        ),
//        Book(
//            title: "Pride and Prejudice",
//            author: "Jane Austen",
//            image: "pap",
//            description: "A classic romance and social commentary set in 19th-century England. Follows Elizabeth Bennet as she navigates issues of class, marriage, and morality while falling for the enigmatic Mr. Darcy.",
//            rating: 4,
//            review: "Witty, elegant, and surprisingly modern in its insights about relationships.",
//            status: .finished,
//            genre: .classic,
//            isFavorite: true
//        ),
//        Book(
//            title: "To Kill a Mockingbird",
//            author: "Harper Lee",
//            image: "tkam",
//            description: "A profound novel about childhood, justice, and racial inequality in the American South. Told through the eyes of Scout Finch, whose father Atticus defends an innocent man in a deeply prejudiced society.",
//            rating: 5,
//            review: "One of the most moving and important books ever written. Powerful characters and message.",
//            status: .finished,
//            genre: .classic,
//            isFavorite: true
//        ),
//        Book(
//            title: "The Hitchhiker's Guide to the Galaxy",
//            author: "Douglas Adams",
//            image: "hitchhiker",
//            description: "A hilarious and absurd intergalactic adventure following Arthur Dent after Earth is destroyed. With the help of Ford Prefect and the eccentric crew, he learns the mysteries of life, the universe, and everything.",
//            rating: 4,
//            review: "Quirky, clever, and endlessly funny. A sci-fi classic with humor unlike anything else.",
//            status: .reading,
//            genre: .scifi,
//            isFavorite: true
//        ),
//        
//        // --- Classics ---
//        Book(
//            title: "Moby-Dick",
//            author: "Herman Melville",
//            image: "mobyDick",
//            description: "The tale of Captain Ahab’s obsessive quest to kill the great white whale, Moby-Dick. A mix of adventure, philosophy, and symbolism.",
//            rating: 2,
//            review: "A challenging read; didn’t click for me.",
//            status: .dropped,
//            genre: .classic
//        ),
//        Book(
//            title: "The Great Gatsby",
//            author: "F. Scott Fitzgerald",
//            image: "greatGatsby",
//            description: "Set in the Roaring Twenties, it tells the story of Jay Gatsby and his love for Daisy Buchanan, exposing themes of wealth, love, and the American Dream.",
//            rating: 5,
//            review: "A short but powerful exploration of dreams and disillusionment.",
//            status: .finished,
//            genre: .classic,
//            isFavorite: true
//        ),
//        Book(
//            title: "Jane Eyre",
//            author: "Charlotte Brontë",
//            image: "janeEyre",
//            description: "A gothic romance about an orphaned girl who grows up facing hardship but remains resilient, eventually finding love and independence.",
//            rating: 4,
//            review: "Strong character development and timeless themes of love and autonomy.",
//            status: .reading,
//            genre: .classic,
//            isFavorite: true
//        ),
//        Book(
//            title: "Wuthering Heights",
//            author: "Emily Brontë",
//            image: "wutheringHeights",
//            description: "A dark, passionate tale of love and revenge set on the Yorkshire moors, following the doomed relationship of Heathcliff and Catherine.",
//            rating: 4,
//            review: "Moody, gothic, and unforgettable in its atmosphere.",
//            status: .planToRead,
//            genre: .classic
//        ),
//        
//        // --- Sci-Fi ---
//        Book(
//            title: "Foundation",
//            author: "Isaac Asimov",
//            image: "foundation",
//            description: "The first in Asimov’s legendary series, telling of the Foundation’s attempt to preserve knowledge and save civilization as the Galactic Empire collapses.",
//            rating: 5,
//            review: "Ambitious, intelligent, and foundational to modern sci-fi.",
//            status: .finished,
//            genre: .scifi,
//            isFavorite: true
//        ),
//        Book(
//            title: "Neuromancer",
//            author: "William Gibson",
//            image: "necromancer",
//            description: "A groundbreaking cyberpunk novel that follows Case, a washed-up hacker, as he’s hired for one last job in a world of AI and cyberspace.",
//            rating: 4,
//            review: "Dark, gritty, and visionary — it practically invented cyberpunk.",
//            status: .reading,
//            genre: .scifi
//        ),
//        Book(
//            title: "Snow Crash",
//            author: "Neal Stephenson",
//            image: "snowCrash",
//            description: "A fast-paced cyberpunk adventure mixing virtual reality, ancient Sumerian myths, and futuristic corporate states.",
//            rating: 3,
//            review: "Chaotic but fun; wild mix of ideas.",
//            status: .planToRead,
//            genre: .scifi,
//            isFavorite: true
//        ),
//        Book(
//            title: "Ender's Game",
//            author: "Orson Scott Card",
//            image: "endersGame",
//            description: "A young boy, Ender Wiggin, is trained in a futuristic battle school to prepare for an alien invasion, blending military strategy with moral dilemmas.",
//            rating: 5,
//            review: "Gripping, emotional, and one of the most influential sci-fi books.",
//            status: .finished,
//            genre: .scifi,
//            isFavorite: true
//        ),
//        
//        // --- Dystopian ---
//        Book(
//            title: "Brave New World",
//            author: "Aldous Huxley",
//            image: "newWorld",
//            description: "A futuristic society built on genetic engineering, consumerism, and the suppression of individuality. Raises questions about happiness and control.",
//            rating: 5,
//            review: "Disturbing but thought-provoking — a must-read alongside 1984.",
//            status: .finished,
//            genre: .dystopian,
//            isFavorite: true
//        ),
//        Book(
//            title: "Fahrenheit 451",
//            author: "Ray Bradbury",
//            image: "fahrenheight451",
//            description: "In a world where books are banned and burned, fireman Guy Montag begins to question society’s values and the cost of censorship.",
//            rating: 4,
//            review: "Powerful and still relevant — a passionate defense of literature.",
//            status: .reading,
//            genre: .dystopian,
//            isFavorite: true
//        ),
//        Book(
//            title: "The Handmaid’s Tale",
//            author: "Margaret Atwood",
//            image: "handmaid",
//            description: "Set in Gilead, a theocratic dictatorship, women are stripped of their rights. Offred, a handmaid, narrates her life under this brutal regime.",
//            rating: 5,
//            review: "Chilling and unforgettable — both terrifying and beautifully written.",
//            status: .finished,
//            genre: .dystopian,
//            isFavorite: true
//        ),
//        
//        // --- Horror ---
//        Book(
//            title: "Dracula",
//            author: "Bram Stoker",
//            image: "dracula",
//            description: "The gothic classic that introduced Count Dracula to the world, mixing horror, romance, and suspense in Victorian England.",
//            rating: 2,
//            review: "Atmospheric and creepy, but ultimately not for me.",
//            status: .dropped,
//            genre: .horror
//        ),
//        Book(
//            title: "Frankenstein",
//            author: "Mary Shelley",
//            image: "frankenstein",
//            description: "A scientist creates life in his pursuit of knowledge, only to face the consequences of playing god. Both horror and philosophical exploration.",
//            rating: 5,
//            review: "Brilliantly ahead of its time — tragic, thought-provoking, and chilling.",
//            status: .finished,
//            genre: .horror,
//            isFavorite: true
//        ),
//        Book(
//            title: "It",
//            author: "Stephen King",
//            image: "it",
//            description: "The terrifying story of a group of children confronting an ancient evil in the town of Derry — a shape-shifting monster often appearing as Pennywise the Clown.",
//            rating: 4,
//            review: "Long but worth it — one of King’s scariest and most human stories.",
//            status: .reading,
//            genre: .horror
//        ),
//        Book(
//            title: "The Shining",
//            author: "Stephen King",
//            image: "shining",
//            description: "Jack Torrance takes a job as caretaker at the haunted Overlook Hotel, slowly descending into madness as his family faces supernatural terror.",
//            rating: 5,
//            review: "Creepy, atmospheric, and unforgettable. A King classic.",
//            status: .finished,
//            genre: .horror,
//            isFavorite: true
//        ),
//        
//        // --- Romance ---
//        Book(
//            title: "Romeo and Juliet",
//            author: "William Shakespeare",
//            image: "raj",
//            description: "The timeless tragedy of star-crossed lovers from feuding families in Verona, Italy.",
//            rating: 4,
//            review: "Beautifully written, though tragic and heartbreaking.",
//            status: .finished,
//            genre: .romance
//        ),
//        Book(
//            title: "The Notebook",
//            author: "Nicholas Sparks",
//            image: "notebook",
//            description: "A love story spanning decades, following Noah and Allie’s passionate but complicated relationship.",
//            rating: 3,
//            review: "Emotional and moving — guaranteed to make you cry.",
//            status: .planToRead,
//            genre: .romance
//        ),
//        Book(
//            title: "Outlander",
//            author: "Diana Gabaldon",
//            image: "outlander",
//            description: "A time-travel romance between Claire, a WWII nurse, and Jamie, an 18th-century Scottish warrior.",
//            rating: 5,
//            review: "Epic, romantic, and thrilling. History and love intertwined.",
//            status: .reading,
//            genre: .romance,
//            isFavorite: true
//        ),
//        
//        // --- Non-Fiction ---
//        Book(
//            title: "Sapiens: A Brief History of Humankind",
//            author: "Yuval Noah Harari",
//            image: "sapiens",
//            description: "An exploration of human history, from hunter-gatherers to the modern age, examining culture, society, and progress.",
//            rating: 5,
//            review: "Insightful and eye-opening — changes how you see humanity.",
//            status: .finished,
//            genre: .nonfiction,
//            isFavorite: true
//        ),
//        Book(
//            title: "Educated",
//            author: "Tara Westover",
//            image: "educated",
//            description: "A memoir of a woman raised in a strict, abusive household in rural Idaho who escapes through education.",
//            rating: 5,
//            review: "Powerful and inspiring. A testament to resilience and learning.",
//            status: .finished,
//            genre: .nonfiction,
//            isFavorite: true
//        ),
//        Book(
//            title: "Becoming",
//            author: "Michelle Obama",
//            image: "becoming",
//            description: "The memoir of the former First Lady, tracing her life from childhood to the White House and beyond.",
//            rating: 4,
//            review: "Inspiring and intimate — a very human perspective from a world figure.",
//            status: .planToRead,
//            genre: .nonfiction
//        ),
//        Book(
//            title: "The Immortal Life of Henrietta Lacks",
//            author: "Rebecca Skloot",
//            image: "immortalLife",
//            description: "The true story of the woman whose cells (HeLa) revolutionized medical research, exploring science, ethics, and race.",
//            rating: 5,
//            review: "Both heartbreaking and fascinating — a must-read in science writing.",
//            status: .reading,
//            genre: .nonfiction,
//            isFavorite: true
//        ),
//        
//        // --- More Filler to hit 40+ total ---
//        Book(
//            title: "Crime and Punishment",
//            author: "Fyodor Dostoevsky",
//            image: "crime",
//            description: "A psychological novel about guilt, redemption, and morality in 19th-century Russia.",
//            rating: 4,
//            review: "Heavy but brilliant.",
//            status: .planToRead,
//            genre: .classic
//        ),
//        Book(
//            title: "The Catcher in the Rye",
//            author: "J.D. Salinger",
//            image: "theCatcher",
//            description: "The rebellious Holden Caulfield narrates his alienation in postwar New York.",
//            rating: 4,
//            review: "Relatable for youth and angst.",
//            status: .finished,
//            genre: .classic
//        ),
//        Book(
//            title: "Les Misérables",
//            author: "Victor Hugo",
//            image: "miserables",
//            description: "The sweeping story of redemption, justice, and revolution in 19th-century France.",
//            rating: 5,
//            review: "Epic and moving.",
//            status: .reading,
//            genre: .classic
//        ),
//        Book(
//            title: "The Road",
//            author: "Cormac McCarthy",
//            image: "theRoad",
//            description: "A bleak, beautiful tale of a father and son surviving in a post-apocalyptic world.",
//            rating: 5,
//            review: "Hauntingly powerful.",
//            status: .finished,
//            genre: .dystopian
//        ),
//        Book(
//            title: "Animal Farm",
//            author: "George Orwell",
//            image: "animalFarm",
//            description: "A satirical allegory where farm animals overthrow humans, exposing corruption of power.",
//            rating: 5,
//            review: "Short but devastating.",
//            status: .finished,
//            genre: .dystopian
//        ),
//        Book(
//            title: "The Stand",
//            author: "Stephen King",
//            image: "stand",
//            description: "An apocalyptic battle of good vs evil after a plague wipes out most of humanity.",
//            rating: 2,
//            review: "Huge scope but I bailed this time.",
//            status: .dropped,
//            genre: .horror
//        ),
//        Book(
//            title: "Misery",
//            author: "Stephen King",
//            image: "misery",
//            description: "A writer held captive by his deranged fan must fight for survival.",
//            rating: 5,
//            review: "Claustrophobic and terrifying.",
//            status: .finished,
//            genre: .horror
//        ),
//        Book(
//            title: "Gone with the Wind",
//            author: "Margaret Mitchell",
//            image: "goneWith",
//            description: "A sweeping Civil War romance following Scarlett O’Hara’s survival and ambition.",
//            rating: 2,
//            review: "Epic and dramatic, but I dropped it.",
//            status: .dropped,
//            genre: .romance
//        ),
//        Book(
//            title: "Me Before You",
//            author: "Jojo Moyes",
//            image: "meBefore",
//            description: "A love story between a quirky caretaker and a quadriplegic man, filled with heartbreak.",
//            rating: 3,
//            review: "Sad but heartfelt.",
//            status: .finished,
//            genre: .romance
//        ),
//        Book(
//            title: "The Diary of a Young Girl",
//            author: "Anne Frank",
//            image: "diary",
//            description: "The writings of Anne Frank during the Nazi occupation, chronicling fear and hope.",
//            rating: 5,
//            review: "Heartbreaking and inspiring.",
//            status: .finished,
//            genre: .nonfiction
//        ),
//        Book(
//            title: "Into the Wild",
//            author: "Jon Krakauer",
//            image: "wild",
//            description: "The tragic story of Christopher McCandless, who ventured into the Alaskan wilderness.",
//            rating: 4,
//            review: "Thought-provoking and sad.",
//            status: .planToRead,
//            genre: .nonfiction
//        )
//    ]
//}
