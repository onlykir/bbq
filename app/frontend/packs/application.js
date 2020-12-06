require("@rails/ujs").start()
require("@rails/activestorage").start()
require('data-confirm-modal')

import '../styles/application'
import 'bootstrap/dist/js/bootstrap'

const images = require.context('../images', true)

