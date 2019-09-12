import React from "react"
import PropTypes from "prop-types"
class ImageUploader extends React.Component {
  render () {
    return (
      <React.Fragment>
        <h3>Image Upoader</h3>
        <ul>
          <li>
            You have {this.props.total} images
          </li>
          <li>
            <a href={this.props.images_url}>back to images</a>
          </li>
        </ul>
        <div>

          <input type='text' name='name' onChange={(event)=> { this.setState({name: event.target.value}) }} />
          <input type='file' onChange={(event)=> { this.readFile(event.target.files) }} accept="image/png, image/jpeg" />
        </div>
      </React.Fragment>
    );
  }
  readFile(fileList) {
    if (fileList && fileList[0]) {
      let formPayLoad = new FormData();
      formPayLoad.append('file', fileList[0]);
      formPayLoad.append('authenticity_token', this.props.authenticity_token);
      formPayLoad.append('name', this.state.name);
      this.uploadToServer(formPayLoad)
    }
  }

  uploadToServer(payLoad){
    fetch('/images', {
      credentials: 'same-origin',
      headers: {},
      method: 'POST',
      body: payLoad
    })
  }

}

ImageUploader.propTypes = {
  total: PropTypes.node,
  images_url: PropTypes.node,
  authenticity_token: PropTypes.node,
};
export default ImageUploader
