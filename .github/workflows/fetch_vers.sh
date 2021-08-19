get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

sudo apt install curl

RESTIC_VERSION=`get_latest_release restic/restic | sed s/v//g`
RCLONE_VERSION=`get_latest_release rclone/rclone | sed s/v//g`

echo Found RESTIC_VERSION=${RESTIC_VERSION}
echo Found RCLONE_VERSION=${RCLONE_VERSION}

echo "RESTIC_VERSION=${RESTIC_VERSION}" >> $GITHUB_ENV
echo "RCLONE_VERSION=${RCLONE_VERSION}" >> $GITHUB_ENV
