require("@rails/ujs").start()
require("@rails/activestorage").start()
require('data-confirm-modal')

import '../styles/application'
import 'bootstrap/dist/js/bootstrap'
import '../scripts/map'
const images = require.context('../images', true)
