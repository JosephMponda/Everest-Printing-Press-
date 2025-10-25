#!/bin/bash

# Script 3: Create Remaining Pages
# Run this after Script 2

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

print_step() {
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

echo "============================================"
echo "   CREATING REMAINING PAGES"
echo "============================================"
echo ""

if [ ! -d "src/pages" ]; then
    echo "Error: Please run this from the everest-printing directory"
    exit 1
fi

# CREATE SERVICES PAGE
print_step "Creating Services Page..."

cat > src/pages/Services.jsx << 'EOFSERVICES'
import React from 'react'
import { Link } from 'react-router-dom'

const Services = () => {
  const allServices = [
    {
      title: 'Offset Printing',
      icon: '🖨️',
      description: 'Professional offset printing services for all your commercial printing needs.',
      items: ['Business Cards', 'Brochures & Flyers', 'Magazines & Catalogs', 'Books & Manuals', 'Letterheads', 'Envelopes', 'Posters', 'Annual Reports']
    },
    {
      title: 'Screen Printing',
      icon: '🎨',
      description: 'High-quality screen printing for apparel, promotional items, and custom merchandise.',
      items: ['T-Shirts & Apparel', 'Promotional Items', 'Tote Bags', 'Caps & Hats', 'Banners', 'Stickers', 'Custom Merchandise', 'Event Materials']
    },
    {
      title: 'Large Format Printing',
      icon: '🏳️',
      description: 'Eye-catching large format printing for advertising, events, and displays.',
      items: ['Banners', 'Billboards', 'Vehicle Wraps', 'Window Graphics', 'Floor Graphics', 'Trade Show Displays', 'Point of Sale', 'Backdrops']
    },
    {
      title: 'Video Production',
      icon: '🎥',
      description: 'Complete video production services from concept to final edit.',
      items: ['Corporate Videos', 'Commercials', 'Event Coverage', 'Product Videos', 'Training Videos', 'Documentaries', 'Social Media Content', 'Video Editing']
    },
    {
      title: 'Design Services',
      icon: '✏️',
      description: 'Professional graphic design services to bring your ideas to life.',
      items: ['Logo Design', 'Brand Identity', 'Marketing Materials', 'Packaging Design', 'Social Media Graphics', 'Illustrations', 'Layout Design', 'Photo Editing']
    },
    {
      title: 'Digital Printing',
      icon: '💻',
      description: 'Quick turnaround digital printing for small to medium print runs.',
      items: ['Business Cards', 'Flyers', 'Postcards', 'Invitations', 'Variable Data Printing', 'Photo Prints', 'Short Run Books', 'Same-Day Printing']
    }
  ]

  return (
    <div className="pt-24">
      <section className="section-padding bg-gradient-to-br from-primary-900 to-primary-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-5xl md:text-6xl font-bold mb-6">Our Services</h1>
          <p className="text-xl">Complete printing and media production solutions for businesses across Malawi</p>
        </div>
      </section>

      <section className="section-padding bg-white">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
            {allServices.map((service, index) => (
              <div key={index} className="bg-white rounded-xl shadow-lg p-8 hover:shadow-2xl transition-all">
                <div className="flex items-start space-x-4 mb-6">
                  <div className="text-5xl">{service.icon}</div>
                  <div>
                    <h2 className="text-3xl font-bold text-gray-900 mb-2">{service.title}</h2>
                    <p className="text-gray-600">{service.description}</p>
                  </div>
                </div>
                <div className="grid grid-cols-2 gap-3">
                  {service.items.map((item, idx) => (
                    <div key={idx} className="flex items-center space-x-2 text-gray-700">
                      <svg className="w-5 h-5 text-primary-600 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                      </svg>
                      <span className="text-sm">{item}</span>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>

          <div className="mt-16 text-center">
            <Link to="/order" className="btn-primary text-lg">
              Request a Quote
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}

export default Services
EOFSERVICES

print_success "Services page created!"

echo ""
echo "Press ENTER to continue..."
read

# CREATE ORDER PAGE
print_step "Creating Order Page with Payment Options..."

cat > src/pages/Order.jsx << 'EOFORDER'
import React, { useState } from 'react'

const Order = () => {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    service: '',
    description: '',
    quantity: '',
    deadline: '',
    payment: ''
  })

  const [submitted, setSubmitted] = useState(false)

  const handleSubmit = (e) => {
    e.preventDefault()
    setSubmitted(true)
    setTimeout(() => setSubmitted(false), 5000)
  }

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value })
  }

  return (
    <div className="pt-24">
      <section className="section-padding bg-gradient-to-br from-primary-900 to-primary-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-5xl md:text-6xl font-bold mb-6">Place Your Order</h1>
          <p className="text-xl">Fill out the form below and we'll get back to you with a quote within 24 hours</p>
        </div>
      </section>

      <section className="section-padding bg-gray-50">
        <div className="max-w-4xl mx-auto">
          {submitted && (
            <div className="mb-8 p-6 bg-green-100 border-2 border-green-500 rounded-lg text-green-800 text-center">
              <svg className="w-12 h-12 mx-auto mb-2" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
              </svg>
              <p className="font-bold text-lg">Order Submitted Successfully!</p>
              <p>We'll contact you shortly with a quote.</p>
            </div>
          )}

          <div className="bg-white rounded-xl shadow-lg p-8">
            <form onSubmit={handleSubmit}>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Full Name *</label>
                  <input
                    type="text"
                    name="name"
                    required
                    value={formData.name}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="John Doe"
                  />
                </div>

                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Email *</label>
                  <input
                    type="email"
                    name="email"
                    required
                    value={formData.email}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="john@example.com"
                  />
                </div>

                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Phone Number *</label>
                  <input
                    type="tel"
                    name="phone"
                    required
                    value={formData.phone}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="+265 999 123 456"
                  />
                </div>

                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Service Required *</label>
                  <select
                    name="service"
                    required
                    value={formData.service}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                  >
                    <option value="">Select a service</option>
                    <option value="offset">Offset Printing</option>
                    <option value="screen">Screen Printing</option>
                    <option value="banner">Banner Printing</option>
                    <option value="video">Video Production</option>
                    <option value="design">Design Services</option>
                    <option value="digital">Digital Printing</option>
                  </select>
                </div>

                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Quantity</label>
                  <input
                    type="number"
                    name="quantity"
                    value={formData.quantity}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="100"
                  />
                </div>

                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Deadline</label>
                  <input
                    type="date"
                    name="deadline"
                    value={formData.deadline}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                  />
                </div>

                <div className="md:col-span-2">
                  <label className="block text-gray-700 font-semibold mb-2">Project Description *</label>
                  <textarea
                    name="description"
                    required
                    value={formData.description}
                    onChange={handleChange}
                    rows="5"
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="Please describe your project requirements, specifications, colors, size, etc."
                  ></textarea>
                </div>

                <div className="md:col-span-2">
                  <label className="block text-gray-700 font-semibold mb-3">Preferred Payment Method *</label>
                  <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                    {['Airtel Money', 'TNM Mpamba', 'Bank Transfer'].map((method) => (
                      <label key={method} className="flex items-center space-x-3 p-4 border-2 border-gray-300 rounded-lg cursor-pointer hover:border-primary-600 transition-colors">
                        <input
                          type="radio"
                          name="payment"
                          value={method.toLowerCase().replace(' ', '-')}
                          checked={formData.payment === method.toLowerCase().replace(' ', '-')}
                          onChange={handleChange}
                          className="w-5 h-5 text-primary-600"
                          required
                        />
                        <span className="font-medium">{method}</span>
                      </label>
                    ))}
                  </div>
                </div>
              </div>

              <div className="mt-8 bg-primary-50 border-2 border-primary-200 rounded-lg p-6">
                <h3 className="font-bold text-lg text-gray-900 mb-3">Payment Information</h3>
                <ul className="space-y-2 text-gray-700">
                  <li className="flex items-start">
                    <span className="font-semibold mr-2">Airtel Money:</span>
                    <span>+265 999 123 456</span>
                  </li>
                  <li className="flex items-start">
                    <span className="font-semibold mr-2">TNM Mpamba:</span>
                    <span>+265 888 123 456</span>
                  </li>
                  <li className="flex items-start">
                    <span className="font-semibold mr-2">Bank:</span>
                    <span>Standard Bank - Account: 9100012345678</span>
                  </li>
                  <li className="text-sm text-gray-600 mt-2">
                    * 50% deposit required before production. Balance due upon completion.
                  </li>
                </ul>
              </div>

              <button
                type="submit"
                className="mt-8 w-full btn-primary text-lg py-4"
              >
                Submit Order Request
              </button>
            </form>
          </div>
        </div>
      </section>
    </div>
  )
}

export default Order
EOFORDER

print_success "Order page created!"

echo ""
echo "Press ENTER to continue..."
read

# CREATE GALLERY PAGE
print_step "Creating Gallery Page..."

cat > src/pages/Gallery.jsx << 'EOFGALLERY'
import React, { useState } from 'react'

const Gallery = () => {
  const [selectedCategory, setSelectedCategory] = useState('all')

  const categories = [
    { id: 'all', label: 'All Work' },
    { id: 'offset', label: 'Offset Printing' },
    { id: 'screen', label: 'Screen Printing' },
    { id: 'banner', label: 'Banners' },
    { id: 'video', label: 'Video Production' }
  ]

  const galleryItems = [
    { category: 'offset', title: 'Business Brochures', description: '500 full-color brochures' },
    { category: 'offset', title: 'Magazine Publication', description: '1000 copies, perfect binding' },
    { category: 'screen', title: 'Event T-Shirts', description: '200 custom printed shirts' },
    { category: 'screen', title: 'Promotional Tote Bags', description: '300 branded bags' },
    { category: 'banner', title: 'Store Front Banner', description: '10ft x 5ft vinyl banner' },
    { category: 'banner', title: 'Trade Show Display', description: 'Retractable banner stand' },
    { category: 'video', title: 'Corporate Video', description: '3-minute company profile' },
    { category: 'video', title: 'Product Commercial', description: '30-second TV ad' },
    { category: 'offset', title: 'Annual Reports', description: '100 page full-color report' },
    { category: 'screen', title: 'Team Uniforms', description: 'Custom sports jerseys' },
    { category: 'banner', title: 'Billboard Design', description: 'Large format outdoor' },
    { category: 'video', title: 'Event Coverage', description: 'Wedding videography' }
  ]

  const filteredItems = selectedCategory === 'all' 
    ? galleryItems 
    : galleryItems.filter(item => item.category === selectedCategory)

  return (
    <div className="pt-24">
      <section className="section-padding bg-gradient-to-br from-primary-900 to-primary-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-5xl md:text-6xl font-bold mb-6">Our Gallery</h1>
          <p className="text-xl">Explore our portfolio of successful projects and satisfied clients</p>
        </div>
      </section>

      <section className="section-padding bg-white">
        <div className="max-w-7xl mx-auto">
          <div className="flex flex-wrap justify-center gap-4 mb-12">
            {categories.map((cat) => (
              <button
                key={cat.id}
                onClick={() => setSelectedCategory(cat.id)}
                className={`px-6 py-3 rounded-lg font-semibold transition-all ${
                  selectedCategory === cat.id
                    ? 'bg-primary-600 text-white shadow-lg'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                {cat.label}
              </button>
            ))}
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {filteredItems.map((item, index) => (
              <div key={index} className="card group cursor-pointer">
                <div className="aspect-video bg-gradient-to-br from-primary-100 to-primary-200 flex items-center justify-center">
                  <div className="text-6xl group-hover:scale-110 transition-transform">
                    {item.category === 'offset' && '📄'}
                    {item.category === 'screen' && '👕'}
                    {item.category === 'banner' && '🏳️'}
                    {item.category === 'video' && '🎬'}
                  </div>
                </div>
                <div className="p-6">
                  <h3 className="text-xl font-bold text-gray-900 mb-2">{item.title}</h3>
                  <p className="text-gray-600">{item.description}</p>
                </div>
              </div>
            ))}
          </div>

          {filteredItems.length === 0 && (
            <div className="text-center py-12 text-gray-500">
              <p className="text-xl">No items found in this category</p>
            </div>
          )}
        </div>
      </section>
    </div>
  )
}

export default Gallery
EOFGALLERY

print_success "Gallery page created!"

echo ""
echo "Press ENTER to continue..."
read

# CREATE ABOUT PAGE
print_step "Creating About Page..."

cat > src/pages/About.jsx << 'EOFABOUT'
import React from 'react'
import { Link } from 'react-router-dom'

const About = () => {
  const team = [
    { name: 'Management Team', role: 'Leadership & Strategy', icon: '👔' },
    { name: 'Design Team', role: 'Creative Professionals', icon: '🎨' },
    { name: 'Production Team', role: 'Print Specialists', icon: '⚙️' },
    { name: 'Video Team', role: 'Media Production', icon: '🎥' }
  ]

  const timeline = [
    { year: '2014', event: 'Everest Printing Press Founded', description: 'Started with basic offset printing services' },
    { year: '2016', event: 'Expanded Services', description: 'Added screen printing and design services' },
    { year: '2018', event: 'New Equipment', description: 'Invested in state-of-the-art printing technology' },
    { year: '2020', event: 'Video Production', description: 'Launched professional video production services' },
    { year: '2024', event: 'Digital Transformation', description: 'Online ordering and expanded digital services' }
  ]

  return (
    <div className="pt-24">
      <section className="section-padding bg-gradient-to-br from-primary-900 to-primary-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-5xl md:text-6xl font-bold mb-6">About Us</h1>
          <p className="text-xl">Over a decade of excellence in printing and media production</p>
        </div>
      </section>

      <section className="section-padding bg-white">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div>
              <h2 className="text-4xl font-bold text-gray-900 mb-6">Our Story</h2>
              <p className="text-gray-700 mb-4 text-lg">
                Everest Printing Press was established in 2014 with a vision to provide 
                high-quality printing services to businesses and individuals across Malawi. 
                Located in the heart of Blantyre at Maselema, behind AGMA House, we've grown 
                from a small offset printing shop to a full-service printing and media production company.
              </p>
              <p className="text-gray-700 mb-4 text-lg">
                Our commitment to quality, customer satisfaction, and continuous innovation 
                has made us the preferred printing partner for hundreds of businesses, 
                organizations, and individuals throughout the country.
              </p>
              <p className="text-gray-700 text-lg">
                Today, we offer a comprehensive range of services including offset printing, 
                screen printing, large format banners, and professional video production, 
                all delivered with the same dedication to excellence that has defined us 
                from day one.
              </p>
            </div>
            <div className="bg-gradient-to-br from-primary-100 to-primary-200 rounded-xl p-12 text-center">
              <div className="text-6xl mb-4">🏔️</div>
              <h3 className="text-2xl font-bold text-gray-900 mb-2">Our Mission</h3>
              <p className="text-gray-700 text-lg">
                To deliver exceptional printing and media production services that exceed 
                expectations, while building lasting relationships with our clients through 
                quality, reliability, and innovation.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section className="section-padding bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl md:text-5xl font-bold text-gray-900 mb-4">Our Journey</h2>
            <p className="text-xl text-gray-600">A decade of growth and innovation</p>
          </div>

          <div className="space-y-8">
            {timeline.map((item, index) => (
              <div key={index} className="flex gap-8 items-start">
                <div className="flex-shrink-0 w-32 text-right">
                  <span className="text-3xl font-bold text-primary-600">{item.year}</span>
                </div>
                <div className="flex-shrink-0 w-4 h-4 bg-primary-600 rounded-full mt-2"></div>
                <div className="flex-grow pb-8 border-l-2 border-primary-200 pl-8 -ml-2">
                  <h3 className="text-2xl font-bold text-gray-900 mb-2">{item.event}</h3>
                  <p className="text-gray-600 text-lg">{item.description}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="section-padding bg-white">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-4xl md:text-5xl font-bold text-gray-900 mb-4">Our Team</h2>
            <p className="text-xl text-gray-600">Dedicated professionals committed to your success</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {team.map((member, index) => (
              <div key={index} className="text-center p-6 rounded-xl bg-gray-50 hover:shadow-lg transition-all">
                <div className="w-24 h-24 bg-primary-100 rounded-full flex items-center justify-center mx-auto mb-4 text-5xl">
                  {member.icon}
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-2">{member.name}</h3>
                <p className="text-gray-600">{member.role}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="section-padding bg-gradient-to-br from-primary-600 to-primary-800 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-4xl md:text-5xl font-bold mb-6">Ready to Work With Us?</h2>
          <p className="text-xl mb-8">Let's bring your printing and media projects to life</p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link to="/order" className="bg-white text-primary-600 px-8 py-4 rounded-lg font-semibold hover:bg-gray-100 transition-all text-lg shadow-lg">
              Start Your Project
            </Link>
            <Link to="/contact" className="bg-transparent border-2 border-white text-white px-8 py-4 rounded-lg font-semibold hover:bg-white/10 transition-all text-lg">
              Contact Us
            </Link>
          </div>
        </div>
      </section>
    </div>
  )
}

export default About
EOFABOUT

print_success "About page created!"

echo ""
echo "Press ENTER to continue to the final page..."
read

# CREATE CONTACT PAGE
print_step "Creating Contact Page..."

cat > src/pages/Contact.jsx << 'EOFCONTACT'
import React, { useState } from 'react'

const Contact = () => {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    subject: '',
    message: ''
  })

  const [submitted, setSubmitted] = useState(false)

  const handleSubmit = (e) => {
    e.preventDefault()
    setSubmitted(true)
    setTimeout(() => setSubmitted(false), 5000)
  }

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value })
  }

  const contactInfo = [
    {
      icon: (
        <svg className="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
        </svg>
      ),
      title: 'Visit Us',
      details: ['Maselema, Behind AGMA House', 'Blantyre, Malawi']
    },
    {
      icon: (
        <svg className="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
        </svg>
      ),
      title: 'Call Us',
      details: ['+265 999 123 456', '+265 888 123 456']
    },
    {
      icon: (
        <svg className="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
        </svg>
      ),
      title: 'Email Us',
      details: ['info@everestprinting.mw', 'orders@everestprinting.mw']
    },
    {
      icon: (
        <svg className="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
      ),
      title: 'Business Hours',
      details: ['Monday - Friday: 8AM - 5PM', 'Saturday: 8AM - 1PM']
    }
  ]

  return (
    <div className="pt-24">
      <section className="section-padding bg-gradient-to-br from-primary-900 to-primary-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h1 className="text-5xl md:text-6xl font-bold mb-6">Contact Us</h1>
          <p className="text-xl">Get in touch with us for any inquiries or project discussions</p>
        </div>
      </section>

      <section className="section-padding bg-white">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 mb-16">
            {contactInfo.map((item, index) => (
              <div key={index} className="text-center p-6 rounded-xl bg-gray-50 hover:shadow-lg transition-all">
                <div className="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center mx-auto mb-4 text-primary-600">
                  {item.icon}
                </div>
                <h3 className="text-lg font-bold text-gray-900 mb-3">{item.title}</h3>
                {item.details.map((detail, idx) => (
                  <p key={idx} className="text-gray-600 text-sm">{detail}</p>
                ))}
              </div>
            ))}
          </div>

          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
            <div>
              <h2 className="text-3xl font-bold text-gray-900 mb-6">Send Us a Message</h2>
              
              {submitted && (
                <div className="mb-6 p-4 bg-green-100 border-2 border-green-500 rounded-lg text-green-800">
                  <p className="font-bold">Message Sent!</p>
                  <p className="text-sm">We'll get back to you soon.</p>
                </div>
              )}

              <form onSubmit={handleSubmit} className="space-y-6">
                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Name *</label>
                  <input
                    type="text"
                    name="name"
                    required
                    value={formData.name}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="Your Name"
                  />
                </div>

                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Email *</label>
                  <input
                    type="email"
                    name="email"
                    required
                    value={formData.email}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="your@email.com"
                  />
                </div>

                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Phone</label>
                  <input
                    type="tel"
                    name="phone"
                    value={formData.phone}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="+265 999 123 456"
                  />
                </div>

                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Subject *</label>
                  <input
                    type="text"
                    name="subject"
                    required
                    value={formData.subject}
                    onChange={handleChange}
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="What is this about?"
                  />
                </div>

                <div>
                  <label className="block text-gray-700 font-semibold mb-2">Message *</label>
                  <textarea
                    name="message"
                    required
                    value={formData.message}
                    onChange={handleChange}
                    rows="5"
                    className="w-full px-4 py-3 border-2 border-gray-300 rounded-lg focus:border-primary-600 focus:outline-none"
                    placeholder="Your message here..."
                  ></textarea>
                </div>

                <button
                  type="submit"
                  className="w-full btn-primary text-lg py-4"
                >
                  Send Message
                </button>
              </form>
            </div>

            <div>
              <h2 className="text-3xl font-bold text-gray-900 mb-6">Find Us</h2>
              <div className="bg-gray-200 rounded-xl h-96 flex items-center justify-center">
                <div className="text-center text-gray-600">
                  <svg className="w-16 h-16 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                  <p className="font-semibold text-lg">Maselema, Behind AGMA House</p>
                  <p>Blantyre, Malawi</p>
                </div>
              </div>

              <div className="mt-8 bg-primary-50 border-2 border-primary-200 rounded-lg p-6">
                <h3 className="font-bold text-lg text-gray-900 mb-4">Need Urgent Assistance?</h3>
                <p className="text-gray-700 mb-4">
                  For urgent printing needs or immediate support, please call us directly during business hours.
                </p>
                <a href="tel:+265999123456" className="btn-primary inline-block">
                  Call Now: +265 999 123 456
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  )
}

export default Contact
EOFCONTACT

print_success "Contact page created!"

echo ""
echo ""
echo -e "${GREEN}============================================${NC}"
echo -e "${GREEN}   ALL PAGES CREATED SUCCESSFULLY!${NC}"
echo -e "${GREEN}============================================${NC}"
echo ""
echo "Your website is now complete with all pages:"
echo "  ✓ Home Page"
echo "  ✓ Services Page"
echo "  ✓ Gallery Page"
echo "  ✓ Order Page (with payment options)"
echo "  ✓ About Page"
echo "  ✓ Contact Page"
echo ""
echo "Next steps:"
echo "  1. Run: npm install"
echo "  2. Run: npm run dev"
echo "  3. Visit: http://localhost:3000"
echo ""
echo "To deploy:"
echo "  - Vercel: npm install -g vercel && vercel"
echo "  - Railway: Push to GitHub and connect Railway"
echo ""
print_success "Setup Complete!"
