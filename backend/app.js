const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

app.use(cors());
app.use(express.json());

// Mock user data for testing
const users = [
  {
    id: 1,
    documentId: 'doc-1',
    username: 'test@example.com',
    email: 'test@example.com',
    provider: 'local',
    fullname: 'Test User',
    approved: true,
    confirmed: true,
    blocked: false,
    createdAt: new Date(),
    updatedAt: new Date(),
    publishedAt: new Date(),
    password: 'password',
    role: 'admin',
    organizationId: 'org-1'
  }
];

// Mock team data
const teamMembers = [
  {
    id: '1',
    userId: '1',
    name: 'John Smith',
    email: 'john@glowpulse.com',
    role: 'admin',
    department: 'Sales',
    phone: '+1-555-0123',
    isActive: true,
    joinedAt: new Date(Date.now() - 365 * 24 * 60 * 60 * 1000),
    lastActive: new Date(),
    permissions: ['read', 'write', 'admin', 'approve'],
    profile: { avatar: 'assets/avatars/john.jpg', bio: 'Senior Sales Manager' },
    organizationId: 'org-1'
  },
  {
    id: '2',
    userId: '2',
    name: 'Sarah Johnson',
    email: 'sarah@glowpulse.com',
    role: 'manager',
    department: 'Marketing',
    phone: '+1-555-0124',
    isActive: true,
    joinedAt: new Date(Date.now() - 180 * 24 * 60 * 60 * 1000),
    lastActive: new Date(Date.now() - 2 * 60 * 60 * 1000),
    permissions: ['read', 'write', 'approve'],
    profile: { avatar: 'assets/avatars/sarah.jpg', bio: 'Marketing Director' },
    organizationId: 'org-1'
  }
];

// Mock event data
const events = [
  {
    id: '1',
    name: 'Tech Expo 2025',
    description: 'Annual technology exhibition showcasing latest innovations',
    location: 'Chicago Convention Center',
    startDate: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000),
    endDate: new Date(Date.now() + 33 * 24 * 60 * 60 * 1000),
    status: 'planning',
    organizerId: '1',
    teamMemberIds: ['1', '2'],
    settings: {
      boothSize: '20x20',
      setupTime: '2 hours',
      teardownTime: '1 hour',
      maxAttendees: 1000
    },
    metadata: {
      industry: 'Technology',
      targetAudience: 'Developers, IT Professionals',
      expectedROI: 150000
    },
    organizationId: 'org-1',
    createdAt: new Date(Date.now() - 60 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 24 * 60 * 60 * 1000)
  }
];

// Mock booth assignments
const boothAssignments = [
  {
    id: '1',
    eventId: '1',
    boothNumber: 'A15',
    hall: 'Main Hall',
    assignedTo: '1',
    status: 'assigned',
    specifications: {
      size: '20x20',
      power: '220V',
      internet: 'High-speed WiFi',
      furniture: 'Included'
    },
    assignedAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000),
    organizationId: 'org-1',
    createdAt: new Date(Date.now() - 10 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000)
  }
];

// Mock expense data
const expenses = [
  {
    id: '1',
    eventId: '1',
    category: 'travel',
    description: 'Flight tickets for Tech Expo team',
    amount: 1250.00,
    currency: 'USD',
    status: 'approved',
    submittedBy: '1',
    approvedBy: '2',
    approvedAt: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000),
    expenseDate: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000),
    submittedAt: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000),
    attachments: ['receipt_flight_001.pdf'],
    metadata: { airline: 'American Airlines', route: 'LAX-CHI' },
    organizationId: 'org-1',
    createdAt: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000)
  }
];

// Mock budget data
const budgets = [
  {
    id: '1',
    eventId: '1',
    name: 'Tech Expo 2025 Budget',
    category: 'overall',
    allocatedAmount: 50000.00,
    spentAmount: 1250.00,
    currency: 'USD',
    startDate: new Date(Date.now() - 60 * 24 * 60 * 60 * 1000),
    endDate: new Date(Date.now() + 40 * 24 * 60 * 60 * 1000),
    status: 'active',
    expenseIds: ['1'],
    organizationId: 'org-1',
    createdAt: new Date(Date.now() - 60 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 24 * 60 * 60 * 1000)
  }
];

// Mock task data
const tasks = [
  {
    id: '1',
    eventId: '1',
    title: 'Setup booth display materials',
    description: 'Prepare and organize all booth display materials including banners, product demos, and promotional items',
    status: 'in_progress',
    priority: 'high',
    assignedTo: '1',
    createdBy: '2',
    dueDate: new Date(Date.now() + 25 * 24 * 60 * 60 * 1000),
    dependencies: [],
    attachments: ['booth_layout.pdf', 'materials_list.xlsx'],
    metadata: { estimatedHours: 4, requiredTools: ['Ladder', 'Drill'] },
    organizationId: 'org-1',
    createdAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 24 * 60 * 60 * 1000)
  }
];

// Mock trade show data
const tradeShows = [
  {
    id: '1',
    name: 'Tech Expo 2025',
    location: 'Chicago Convention Center',
    boothNumber: 'A15',
    hall: 'Main Hall',
    startDate: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000),
    endDate: new Date(Date.now() + 33 * 24 * 60 * 60 * 1000),
    product: 'Smart Home Suite 2025',
    status: 'upcoming',
    description: 'Annual technology exhibition showcasing latest innovations',
    notes: 'Focus on IoT and smart home technologies',
    organizationId: 'org-1',
    createdAt: new Date(Date.now() - 60 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 24 * 60 * 60 * 1000)
  }
];

// Mock trade show bookings
const tradeShowBookings = [
  {
    id: '1',
    tradeShowId: '1',
    userId: '1',
    boothNumber: 'A15',
    hall: 'Main Hall',
    startDate: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000),
    endDate: new Date(Date.now() + 33 * 24 * 60 * 60 * 1000),
    product: 'Smart Home Suite 2025',
    status: 'confirmed',
    specialRequirements: 'High-speed internet and power outlets',
    organizationId: 'org-1',
    createdAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 24 * 60 * 60 * 1000)
  }
];

// Mock shipping orders
const shippingOrders = [
  {
    id: '1',
    tradeShowId: '1',
    userId: '1',
    orderNumber: 'SO-001',
    status: 'pending',
    shippingAddress: '123 Main St, Chicago, IL 60601',
    recipientName: 'John Smith',
    recipientPhone: '+1-555-0123',
    carrier: 'FedEx',
    trackingNumber: null,
    estimatedDelivery: new Date(Date.now() + 3 * 24 * 60 * 60 * 1000),
    items: [
      {
        id: '1',
        name: 'Smart Home Suite 2025',
        quantity: 1,
        description: 'Complete smart home system',
        weight: 15.5,
        dimensions: '24" x 18" x 12"',
        sku: 'SHS-2025-001'
      }
    ],
    notes: 'Handle with care - fragile equipment',
    totalCost: 89.99,
    organizationId: 'org-1',
    createdAt: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000)
  }
];

// Auth routes
app.post('/api/auth/login', (req, res) => {
  const { email, password } = req.body;
  
  // Find user by email
  const user = users.find(u => u.email === email);
  
  if (user && (password === 'password' || user.password === password)) {
    // Check if user is approved
    if (!user.approved) {
      return res.status(401).json({ error: { message: 'You have not been approved yet. Please wait for approval.' } });
    }
    
    res.json({
      user: user,
      jwt: 'mock-jwt-token'
    });
  } else {
    res.status(401).json({ error: { message: 'Invalid credentials' } });
  }
});

app.post('/api/auth/signup', (req, res) => {
  const { name, email, password } = req.body;
  
  // Check if user already exists
  const existingUser = users.find(u => u.email === email);
  if (existingUser) {
    return res.status(400).json({ error: { message: 'User already exists' } });
  }
  
  // Create new user with password - automatically approved
  const newUser = {
    id: users.length + 1,
    documentId: `doc-${users.length + 1}`,
    username: email,
    email: email,
    provider: 'local',
    fullname: name,
    password: password, // Store password for authentication
    approved: true, // Automatically approved - no admin approval needed
    confirmed: true,
    blocked: false,
    createdAt: new Date(),
    updatedAt: new Date(),
    publishedAt: new Date()
  };
  
  users.push(newUser);
  
  res.json({
    user: newUser,
    message: 'User created successfully and approved!'
  });
});

// Note: Admin approval removed - all users are automatically approved

// Helper function to get user's organization ID
const getUserOrganization = (userId) => {
  const user = users.find(u => u.id == userId);
  return user ? user.organizationId : null;
};

// Helper function to authenticate requests
const authenticateRequest = (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return res.status(401).json({ error: { message: 'No token provided' } });
  }
  
  // For now, accept any Bearer token (in production, validate JWT)
  const token = authHeader.substring(7);
  if (token === 'mock-jwt-token') {
    req.user = users[0]; // Use first user for demo
    next();
  } else {
    res.status(401).json({ error: { message: 'Invalid token' } });
  }
};

// Team Management Endpoints
app.get('/api/team/members', authenticateRequest, (req, res) => {
  const orgId = getUserOrganization(req.user.id);
  const orgMembers = teamMembers.filter(m => m.organizationId === orgId);
  res.json({ data: orgMembers });
});

app.post('/api/team/invitations', authenticateRequest, (req, res) => {
  const { email, role } = req.body;
  const newInvitation = {
    id: Date.now().toString(),
    email,
    role,
    invitedBy: req.user.id,
    invitedAt: new Date(),
    expiresAt: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
    status: 'pending',
    token: `invite_${Date.now()}`,
    organizationId: getUserOrganization(req.user.id)
  };
  
  // In a real app, save to database and send email
  res.status(201).json({ data: newInvitation, message: 'Invitation sent successfully' });
});

app.patch('/api/team/members/:id', authenticateRequest, (req, res) => {
  const { id } = req.params;
  const updates = req.body;
  
  const memberIndex = teamMembers.findIndex(m => m.id === id);
  if (memberIndex === -1) {
    return res.status(404).json({ error: { message: 'Team member not found' } });
  }
  
  teamMembers[memberIndex] = { ...teamMembers[memberIndex], ...updates, updatedAt: new Date() };
  res.json({ data: teamMembers[memberIndex], message: 'Team member updated successfully' });
});

// Event Management Endpoints
app.get('/api/events', authenticateRequest, (req, res) => {
  const orgId = getUserOrganization(req.user.id);
  const orgEvents = events.filter(e => e.organizationId === orgId);
  res.json({ data: orgEvents });
});

app.post('/api/events', authenticateRequest, (req, res) => {
  const eventData = req.body;
  const newEvent = {
    id: Date.now().toString(),
    ...eventData,
    organizerId: req.user.id,
    organizationId: getUserOrganization(req.user.id),
    createdAt: new Date(),
    updatedAt: new Date()
  };
  
  events.push(newEvent);
  res.status(201).json({ data: newEvent, message: 'Event created successfully' });
});

app.get('/api/events/:id', authenticateRequest, (req, res) => {
  const { id } = req.params;
  const event = events.find(e => e.id === id);
  
  if (!event) {
    return res.status(404).json({ error: { message: 'Event not found' } });
  }
  
  res.json({ data: event });
});

// Booth Assignment Endpoints
app.get('/api/booth-assignments/:eventId', authenticateRequest, (req, res) => {
  const { eventId } = req.params;
  const orgId = getUserOrganization(req.user.id);
  const eventBooths = boothAssignments.filter(b => b.eventId === eventId && b.organizationId === orgId);
  res.json({ data: eventBooths });
});

app.post('/api/booth-assignments', authenticateRequest, (req, res) => {
  const boothData = req.body;
  const newBooth = {
    id: Date.now().toString(),
    ...boothData,
    organizationId: getUserOrganization(req.user.id),
    createdAt: new Date(),
    updatedAt: new Date()
  };
  
  boothAssignments.push(newBooth);
  res.status(201).json({ data: newBooth, message: 'Booth assigned successfully' });
});

// Financial Management Endpoints
app.get('/api/expenses', authenticateRequest, (req, res) => {
  const orgId = getUserOrganization(req.user.id);
  const orgExpenses = expenses.filter(e => e.organizationId === orgId);
  res.json({ data: orgExpenses });
});

app.post('/api/expenses', authenticateRequest, (req, res) => {
  const expenseData = req.body;
  const newExpense = {
    id: Date.now().toString(),
    ...expenseData,
    submittedBy: req.user.id,
    status: 'pending',
    submittedAt: new Date(),
    organizationId: getUserOrganization(req.user.id),
    createdAt: new Date(),
    updatedAt: new Date()
  };
  
  expenses.push(newExpense);
  res.status(201).json({ data: newExpense, message: 'Expense submitted successfully' });
});

app.patch('/api/expenses/:id/approve', authenticateRequest, (req, res) => {
  const { id } = req.params;
  const expenseIndex = expenses.findIndex(e => e.id === id);
  
  if (expenseIndex === -1) {
    return res.status(404).json({ error: { message: 'Expense not found' } });
  }
  
  expenses[expenseIndex].status = 'approved';
  expenses[expenseIndex].approvedBy = req.user.id;
  expenses[expenseIndex].approvedAt = new Date();
  expenses[expenseIndex].updatedAt = new Date();
  
  res.json({ data: expenses[expenseIndex], message: 'Expense approved successfully' });
});

app.patch('/api/expenses/:id/reject', authenticateRequest, (req, res) => {
  const { id } = req.params;
  const { reason } = req.body;
  const expenseIndex = expenses.findIndex(e => e.id === id);
  
  if (expenseIndex === -1) {
    return res.status(404).json({ error: { message: 'Expense not found' } });
  }
  
  expenses[expenseIndex].status = 'rejected';
  expenses[expenseIndex].metadata = { ...expenses[expenseIndex].metadata, rejectionReason: reason };
  expenses[expenseIndex].updatedAt = new Date();
  
  res.json({ data: expenses[expenseIndex], message: 'Expense rejected successfully' });
});

app.get('/api/budgets', authenticateRequest, (req, res) => {
  const orgId = getUserOrganization(req.user.id);
  const orgBudgets = budgets.filter(b => b.organizationId === orgId);
  res.json({ data: orgBudgets });
});

// Task Management Endpoints
app.get('/api/tasks', authenticateRequest, (req, res) => {
  const orgId = getUserOrganization(req.user.id);
  const orgTasks = tasks.filter(t => t.organizationId === orgId);
  res.json({ data: orgTasks });
});

app.post('/api/tasks', authenticateRequest, (req, res) => {
  const taskData = req.body;
  const newTask = {
    id: Date.now().toString(),
    ...taskData,
    createdBy: req.user.id,
    status: 'pending',
    organizationId: getUserOrganization(req.user.id),
    createdAt: new Date(),
    updatedAt: new Date()
  };
  
  tasks.push(newTask);
  res.status(201).json({ data: newTask, message: 'Task created successfully' });
});

app.patch('/api/tasks/:id', authenticateRequest, (req, res) => {
  const { id } = req.params;
  const updates = req.body;
  
  const taskIndex = tasks.findIndex(t => t.id === id);
  if (taskIndex === -1) {
    return res.status(404).json({ error: { message: 'Task not found' } });
  }
  
  tasks[taskIndex] = { ...tasks[taskIndex], ...updates, updatedAt: new Date() };
  res.json({ data: tasks[taskIndex], message: 'Task updated successfully' });
});

// Trade Show Endpoints
app.get('/api/trade-shows', authenticateRequest, (req, res) => {
  const orgId = getUserOrganization(req.user.id);
  const orgTradeShows = tradeShows.filter(t => t.organizationId === orgId);
  res.json({ data: orgTradeShows });
});

app.get('/api/trade-show-bookings', authenticateRequest, (req, res) => {
  const orgId = getUserOrganization(req.user.id);
  const orgBookings = tradeShowBookings.filter(b => b.organizationId === orgId);
  res.json({ data: orgBookings });
});

app.post('/api/trade-show-bookings', authenticateRequest, (req, res) => {
  const bookingData = req.body;
  const newBooking = {
    id: Date.now().toString(),
    ...bookingData,
    userId: req.user.id,
    status: 'pending',
    organizationId: getUserOrganization(req.user.id),
    createdAt: new Date(),
    updatedAt: new Date()
  };
  
  tradeShowBookings.push(newBooking);
  res.status(201).json({ data: newBooking, message: 'Trade show booked successfully' });
});

// Shipping Order Endpoints
app.get('/api/shipping-orders', authenticateRequest, (req, res) => {
  const orgId = getUserOrganization(req.user.id);
  const orgOrders = shippingOrders.filter(o => o.organizationId === orgId);
  res.json({ data: orgOrders });
});

app.post('/api/shipping-orders', authenticateRequest, (req, res) => {
  const orderData = req.body;
  const newOrder = {
    id: Date.now().toString(),
    ...orderData,
    userId: req.user.id,
    orderNumber: `SO-${Date.now()}`,
    status: 'pending',
    organizationId: getUserOrganization(req.user.id),
    createdAt: new Date(),
    updatedAt: new Date()
  };
  
  shippingOrders.push(newOrder);
  res.status(201).json({ data: newOrder, message: 'Shipping order created successfully' });
});

// Financial Summary Endpoint
app.get('/api/financial-summary/:eventId', authenticateRequest, (req, res) => {
  const { eventId } = req.params;
  const orgId = getUserOrganization(req.user.id);
  
  const eventExpenses = expenses.filter(e => e.eventId === eventId && e.organizationId === orgId);
  const eventBudgets = budgets.filter(b => b.eventId === eventId && b.organizationId === orgId);
  
  const totalExpenses = eventExpenses.reduce((sum, e) => sum + e.amount, 0);
  const totalBudget = eventBudgets.reduce((sum, b) => sum + b.allocatedAmount, 0);
  const remainingBudget = totalBudget - totalExpenses;
  
  const expensesByCategory = {};
  eventExpenses.forEach(expense => {
    expensesByCategory[expense.category] = (expensesByCategory[expense.category] || 0) + 1;
  });
  
  const summary = {
    totalBudget,
    totalExpenses,
    remainingBudget,
    utilizationPercentage: totalBudget > 0 ? (totalExpenses / totalBudget) * 100 : 0,
    expensesByCategory,
    pendingExpenses: eventExpenses.filter(e => e.status === 'pending').length,
    approvedExpenses: eventExpenses.filter(e => e.status === 'approved').length,
    paidExpenses: eventExpenses.filter(e => e.status === 'paid').length
  };
  
  res.json({ data: summary });
});

// Task Summary Endpoint
app.get('/api/task-summary/:eventId', authenticateRequest, (req, res) => {
  const { eventId } = req.params;
  const orgId = getUserOrganization(req.user.id);
  
  const eventTasks = tasks.filter(t => t.eventId === eventId && t.organizationId === orgId);
  
  const totalTasks = eventTasks.length;
  const completedTasks = eventTasks.filter(t => t.status === 'completed').length;
  const inProgressTasks = eventTasks.filter(t => t.status === 'in_progress').length;
  const pendingTasks = eventTasks.filter(t => t.status === 'pending').length;
  
  const overdueTasks = eventTasks.filter(t => {
    const now = new Date();
    return t.dueDate < now && t.status !== 'completed';
  }).length;
  
  const dueSoonTasks = eventTasks.filter(t => {
    const now = new Date();
    const daysUntilDue = (t.dueDate - now) / (1000 * 60 * 60 * 24);
    return daysUntilDue <= 3 && daysUntilDue > 0 && t.status !== 'completed';
  }).length;
  
  const tasksByPriority = {};
  eventTasks.forEach(task => {
    tasksByPriority[task.priority] = (tasksByPriority[task.priority] || 0) + 1;
  });
  
  const summary = {
    totalTasks,
    completedTasks,
    inProgressTasks,
    pendingTasks,
    overdueTasks,
    dueSoonTasks,
    completionRate: totalTasks > 0 ? (completedTasks / totalTasks) * 100 : 0,
    tasksByPriority
  };
  
  res.json({ data: summary });
});

app.get('/', (req, res) => {
  res.send('Health Device Backend API - Full Team Management Enabled');
});

// Error handler
app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).json({ error: 'Internal Server Error' });
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  console.log(`Test credentials: test@example.com / password`);
}); 