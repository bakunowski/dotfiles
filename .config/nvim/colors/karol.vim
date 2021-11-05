lua << EOF
package.loaded['karol'] = nil
package.loaded['karol.util'] = nil
package.loaded['karol.colors'] = nil
package.loaded['karol.theme'] = nil
package.loaded['karol.functions'] = nil

require('karol').set()
EOF
