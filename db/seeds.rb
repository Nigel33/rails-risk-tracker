sara = User.create(full_name: 'Sara Hicks', email: 'sara@example.com', admin: true, password: 'password')
john = User.create(full_name: 'John Doe', email: 'joe@example.com', admin: false, password: 'password')
don = User.create(full_name: 'Don Juan', email: 'don@example.com', admin: false, password: 'password')
shiba = User.create(full_name: 'Shiba Inu', email: 'shiba@example.com', admin: false, password: 'password')

chemical = Niche.create(name: 'chemical')
manufacturing = Niche.create(name: 'manufacturing')

nitro = Company.create(name: 'Nitro Chemical', address: '1245 Green Boulevard, Bloomington, Illinois', niche: chemical)
chemlab = Company.create(name: 'ChemLab', address: "4512 Granite Lane, Bunderfield, Kansas", niche: chemical)
escrow = Company.create(name: 'Escrow Solutions', address: "3454 Turpentine Road, Grimes, Iowa", niche: chemical)
agent = Company.create(name: "Agent C", address: '2908 Grand Ave, Huskerale, California', niche: chemical )

engine = Company.create(name: 'Engineering Lab', address: '2212 Federal Lane, Potter, Idaho', niche: manufacturing)
hunter = Company.create(name: 'Hunter Manufacturing', address: '2212 Federal Lane, Potter, Idaho', niche: manufacturing)
fedora = Company.create(name: 'Fedora Creations', address: '2212 Federal Lane, Potter, Idaho', niche: manufacturing)

work1 = WorkItem.create(user: john, company: nitro, due_date: 20.days.from_now)
work2 = WorkItem.create(user: john, company: chemlab, due_date: 22.days.from_now)
work3 = WorkItem.create(user: john, company: escrow, due_date: 23.days.from_now)
work4 = WorkItem.create(user: john, company: escrow, due_date: 26.days.from_now)
work5 = WorkItem.create(user: john, company: engine, due_date: 25.days.from_now)
work6 = WorkItem.create(user: john, company: hunter, due_date: 22.days.from_now)
work7 = WorkItem.create(user: john, company: nitro, due_date: 23.days.from_now)

work8 = WorkItem.create(user: don, company: fedora, due_date: 20.days.from_now)
work9 = WorkItem.create(user: don, company: agent, due_date: 23.days.from_now)







