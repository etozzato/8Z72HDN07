import React from "react"
import PropTypes from "prop-types"
class ImagePaginator extends React.Component {
  render () {
    return (
      <React.Fragment>
        <h3>Image Listing</h3>
        <ul>
          <li>
            You have {this.props.total} images
          </li>
          <li>
            <a href={this.props.upload_url}>upload an image</a>
          </li>
        </ul>
      </React.Fragment>
    );
  }
}

ImagePaginator.propTypes = {
  upload_url: PropTypes.node,
  total: PropTypes.node,
  page: PropTypes.node
};
export default ImagePaginator
