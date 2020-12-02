require("@rails/ujs").start()
require("@rails/activestorage").start()

import '../styles/application'
import 'bootstrap/dist/js/bootstrap'

const images = require.context('../images', true)

