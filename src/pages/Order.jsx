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
