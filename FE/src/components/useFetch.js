import { useState, useEffect } from "react";

const useFetch = (callback, url) => {
  const [loading, setLoading] = useState(false);
  const fetchInitialData = async () => {
    setLoading(true);
    const response = await fetch(url);
    const fetchData = await response.json();
    callback(fetchData.contents.data);
    setLoading(false);
  }

  useEffect(() => {
    fetchInitialData();
  }, []);

  return loading;
};

export default useFetch;
