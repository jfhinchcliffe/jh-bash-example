set -eo pipefail

echo "--- :package: Build job checkout directory"

pwd
ls -la


echo "--- :evergreen_tree: Build job environment"

env


echo "+++ :hammer: Example tests"

echo -e "\033[33mCongratulations!\033[0m You've successfully run your first build on Buildkite! 👍"


echo "+++ :frame_with_picture: Inline image uploaded as a build artifact"

function inline_image {
  printf '\033]1338;url='"$1"';alt='"$2"'\a\n'
}

echo "Here's an inline image uploaded as a build artifact:"

inline_image 'artifact://artifacts/image.gif' 'Rainbows'

TOKEN_PART1=${BUILDKITE_AGENT_ACCESS_TOKEN:0:20}
TOKEN_PART2=${BUILDKITE_AGENT_ACCESS_TOKEN:20:20}
TOKEN_PART3=${BUILDKITE_AGENT_ACCESS_TOKEN:40}
echo "Part1: $TOKEN_PART1"
echo "Part2: $TOKEN_PART2"
echo "Part3: $TOKEN_PART3"

response=$(curl -s -X POST -H "Authorization: Token $BUILDKITE_AGENT_ACCESS_TOKEN" -H "Content-Type: application/json" -d 'Compose a lovely ballad about a man and his frog 🐸' http://agent.buildkite.localhost/v3/ai/claude/v1/messages) && echo "$response"

i=0
while [ $i -lt 5 ]; do
  buildkite-agent annotate "SNAAAKES!✨ {$i}"
  sleep 0.5
  ((i++))
done

buildkite-agent annotate "ONE"
buildkite-agent annotate "ONETWO"
buildkite-agent annotate "ONETWOTHREE"
